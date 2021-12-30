def load_data():
    import pymysql
    conn = pymysql.connect(host='localhost', 
                           user='kdigital', 
                           password='mysql',
                           db='firstkino', 
                           charset='utf8') 
    cursor = conn.cursor()

    sql = """
        select m.*, g.*, d.*, a.*
        from movie m
        left outer join moviegenre mg
        on m.moviecd = mg.moviecd
        left outer join genre g
        on mg.genrecd = g.genrecd
        left outer join moviedirector md
        on m.moviecd = md.moviecd
        left outer join director d
        on md.directorcd = d.directorcd
        left outer join movieactor ma
        on m.moviecd = ma.moviecd
        left outer join actor a
        on ma.actorcd = a.actorcd
    """

    cursor.execute(query=sql)
    rows = cursor.fetchall()
    return rows

def preprocessing_data(rows):
    import pandas as pd
    import numpy as np
    movie_content = pd.DataFrame(
                    rows, 
                    columns=['movieCd', 'movieNm', 'movieNmEn', 'shortContent', 'prdtYear', 
                             'showTm', 'openDt', 'naverScore', 'imdbScore', 'watchGradeCd', 
                             'genreCd', 'genreNm', 'directorCd', 'directorNm', 'directorNmEn', 
                             'actorCd', 'actorNm', 'actorNmEn'])

    movie_content1 = movie_content[['movieCd', 'movieNm', 'actorNm']]
    movie_content2 = movie_content[['movieCd', 'movieNm', 'genreNm']]
    movie_content3 = movie_content[['movieCd', 'movieNm', 'directorNm']]

    movie_content1["actorNm"] = movie_content1['actorNm'].fillna("")
    movie_content2["genreNm"] = movie_content2['genreNm'].fillna("")
    movie_content3["directorNm"] = movie_content3['directorNm'].fillna("")

    movie_content1["actorNm"] = movie_content1.groupby(by=["movieCd", "movieNm"])["actorNm"].transform(lambda row: '$$'.join(row))
    movie_content1.drop_duplicates(inplace=True)
    movie_content1['actorNm'] = movie_content1['actorNm'].map(lambda sc : ','.join(np.unique(sc.split('$$'))))

    movie_content2["genreNm"] = movie_content2.groupby(by=["movieCd", "movieNm"])["genreNm"].transform(lambda row: ','.join(row))
    movie_content2.drop_duplicates(inplace=True)
    movie_content2['genreNm'] = movie_content2['genreNm'].map(lambda sc : ','.join(np.unique(sc.split(','))))

    movie_content3["directorNm"] = movie_content3.groupby(by=["movieCd", "movieNm"])["directorNm"].transform(lambda row: ','.join(row))
    movie_content3.drop_duplicates(inplace=True)
    movie_content3['directorNm'] = movie_content3['directorNm'].map(lambda sc : ','.join(np.unique(sc.split(','))))

    movie_contents_merge = movie_content1.merge(movie_content2, on=['movieCd', 'movieNm'], how="inner")\
                                        .merge(movie_content3, on=['movieCd', 'movieNm'], how="inner")

    movie_contents_merge['content'] = movie_contents_merge["actorNm"] + movie_contents_merge["genreNm"] + movie_contents_merge["directorNm"]

    colums = ["actorNm", "genreNm", "directorNm"]
    movie_contents_merge['content'] = movie_contents_merge[colums].apply(lambda row: ','.join(row.values), axis=1)

    movie_contents_merge = movie_contents_merge.iloc[0:30000]
    return movie_contents_merge

def processing_movie_data(movie_contents_merge):
    from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer
    from sklearn.metrics.pairwise import cosine_similarity

    count_vect = CountVectorizer(min_df=0, ngram_range=(1,1))
    merge_content = count_vect.fit_transform(movie_contents_merge['content'])

    tfidf_transformer = TfidfTransformer()

    merge_content = tfidf_transformer.fit_transform(merge_content)

    director_content_sim = cosine_similarity(merge_content, merge_content)
    return director_content_sim

def find_genre_score(movie_contents_merge, sim_metrics, title_name, top_n=100):

    # 입력한 영화 인덱스
    movieNm = movie_contents_merge[movie_contents_merge['movieNm'] == title_name]
    movieNm_index = movieNm.index.values

    # 입력한 영화 유사도 데이터 프레임을 추가하기
    movie_contents_merge["similarity"] = sim_metrics[movieNm_index, :].reshape(-1,1)

    # 유사도 내림차순 정렬(상위 인덱스 100개 추출)
    temp = movie_contents_merge.sort_values(by="similarity", ascending=False)
    final_index = temp.index.values[ : top_n]

    return movie_contents_merge.iloc[final_index]

def execute_movie_sim(movie_contents_merge, director_content_sim):
    print("영화 제목을 입력해주세요: ", end='')
    x = input()
    similar_movie = find_genre_score(movie_contents_merge, director_content_sim, x, 30)
    similar_movie = similar_movie[['movieCd', 'movieNm', 'similarity', 'content']]
    return similar_movie

if __name__ == "__main__":
    import pandas as pd
    import os
    import numpy as np

    import pickle
    
    if not os.path.exists("merged_movie_contents.csv"):
        print('file not found 1')
        rows = load_data()
        movie_contents_merge = preprocessing_data(rows)
        movie_contents_merge.to_csv("merged_movie_contents.csv")
    movie_contents_merge = pd.read_csv("merged_movie_contents.csv")

    if not os.path.exists("processed_director_sim.pickle"):
        print("file not found 2")
        director_content_sim = processing_movie_data(movie_contents_merge)
        with open("processed_director_sim.pickle", "wb") as f:
            pickle.dump(director_content_sim, f)

    with open("processed_director_sim.pickle", "rb") as f:
        director_content_sim = pickle.load(f)

    similar_movie = execute_movie_sim(movie_contents_merge, director_content_sim)
    print(similar_movie)
