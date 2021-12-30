import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
import seaborn as SNS
import surprise
import pymysql
from surprise.model_selection import train_test_split
from surprise.dataset import DatasetAutoFolds
from surprise.dataset import Dataset, Reader
from surprise import accuracy
from surprise import SVD
from surprise.model_selection import cross_validate

def access_database():
    conn = pymysql.connect(host='localhost', 
                           user='kdigital', 
                           password='mysql',
                           db='firstkino', 
                           charset='utf8') 
    cursor = conn.cursor()

    return conn, cursor

def load_movie_data():
    conn, cursor = access_database()
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
    movie_content = pd.DataFrame(rows, columns=['movieCd', 'movieNm', 'movieNmEn', 'shortContent', 
                                                'prdtYear', 'showTm', 'openDt', 'naverScore', 'imdbScore', 
                                                'watchGradeCd', 'genreCd', 'genreNm', 'directorCd', 'directorNm', 
                                                'directorNmEn', 'actorCd', 'actorNm', 'actorNmEn'])
    return movie_content

def load_userscore():
    conn, cursor = access_database()
    sql = """
        select * from moviescore
        """

    cursor.execute(query=sql)
    rows = cursor.fetchall()

    user = pd.DataFrame(rows, columns=['movieCd','userId', 'userScore'])
    userscore = user[['userId','movieCd','userScore']]
    userscore.to_csv('./userpoint2.csv', index=False, header=False)

    return userscore

def preprocessing_movie_data(movie_content):
    movie_content1 = movie_content[['movieCd', 'movieNm', 'actorNm']]
    movie_content2 = movie_content[['movieCd', 'movieNm', 'genreNm']]
    movie_content3 = movie_content[['movieCd', 'movieNm', 'directorNm']]
    movie_content4 = movie_content[['movieCd', 'movieNm', 'shortContent']]

    movie_content1["actorNm"] = movie_content1['actorNm'].fillna("")
    movie_content2["genreNm"] = movie_content2['genreNm'].fillna("")
    movie_content3["directorNm"] = movie_content3['directorNm'].fillna("")
    movie_content4["shortContent"] = movie_content4['shortContent'].fillna("")

    return movie_content1, movie_content2, movie_content3, movie_content4

def preprocessing_sim_col(movie_content1, movie_content2, movie_content3, movie_content4):
    movie_content1["actorNm"] = movie_content1.groupby(by=["movieCd", "movieNm"])["actorNm"].transform(lambda row: '$$'.join(row))
    movie_content1.drop_duplicates(inplace=True)
    movie_content1['actorNm'] = movie_content1['actorNm'].map(lambda sc : ','.join(np.unique(sc.split('$$'))))

    movie_content2["genreNm"] = movie_content2.groupby(by=["movieCd", "movieNm"])["genreNm"].transform(lambda row: ','.join(row))
    movie_content2.drop_duplicates(inplace=True)
    movie_content2['genreNm'] = movie_content2['genreNm'].map(lambda sc : ','.join(np.unique(sc.split(','))))

    movie_content3["directorNm"] = movie_content3.groupby(by=["movieCd", "movieNm"])["directorNm"].transform(lambda row: ','.join(row))
    movie_content3.drop_duplicates(inplace=True)
    movie_content3['directorNm'] = movie_content3['directorNm'].map(lambda sc : ','.join(np.unique(sc.split(','))))

    movie_content4["shortContent"] = movie_content4.groupby(by=["movieCd", "movieNm"])["shortContent"].transform(lambda row: ','.join(row))
    movie_content4.drop_duplicates(inplace=True)
    movie_content4['shortContent'] = movie_content4['shortContent'].map(lambda sc : ','.join(np.unique(sc.split(','))))

    movie_data= movie_content1.merge(movie_content2, on=['movieCd', 'movieNm'], how="inner")\
                                        .merge(movie_content3, on=['movieCd', 'movieNm'], how="inner")\
                                            .merge(movie_content4, on=['movieCd', 'movieNm'], how="inner")
    return movie_data



def collab_filtering():
    reader = Reader(line_format='user item rating', sep=',', rating_scale=(0.5,5))
    data_folds = DatasetAutoFolds(ratings_file='./userpoint2.csv', reader=reader)
    trainset = data_folds.build_full_trainset()

    algo = SVD(n_epochs=20, n_factors=50, random_state=42)
    algo.fit(trainset)
    return algo

def adding_col(userscore):
    userscore2 = userscore.copy()
    row = userscore2.columns
    userscore2.columns = ["userId", "movieCd", "userScore"]
    userscore2 = userscore2.append(pd.DataFrame([row.to_list()], columns=["userId", "movieCd", "userScore"]))

    userscore2 = userscore2.drop(index=0, axis=0)
    return userscore2

def naversee_surprise(userscore2, movie_data):
    print("ID를 입력해주세요: ", end='')
    userId = input()
    seen_movie = userscore2[userscore2['userId']== userId]['movieCd'].astype(int).tolist()

    all_movie = movie_data['movieCd'].astype(int).tolist()

    naver_seen_movie = [ movie for movie in all_movie if int(movie) not in seen_movie]

    all_movie_li = len(all_movie)
    seen_li = len(seen_movie)
    naver_seen_li = len(naver_seen_movie)

    return naver_seen_movie

def recommend_movie(algo, naver_seen_movie, top_n=20):
    print("ID를 입력해주세요: ", end='')
    userId = input()
    predictions = []
    for movieCd in naver_seen_movie:
        predictions.append(algo.predict(str(userId), str(movieCd)))

    def sortkey_est(pred):
        return pred.est

    predictions.sort(key=sortkey_est, reverse=True)

    top_pred = predictions[:top_n]

    for pred in top_pred:
        
        movie_Cd = int(pred.iid)
        movie_title = movie_data[movie_data["movieCd"] == str(movie_Cd)]["movieNm"].tolist()
        movie_rating = pred.est
        
        print(f"{movie_title}: {movie_rating:.2f}")

if __name__ == "__main__":
    movie_content = load_movie_data()
    userscore = load_userscore()
    movie_content1, movie_content2, movie_content3, movie_content4 = preprocessing_movie_data(movie_content)
    movie_data = preprocessing_sim_col(movie_content1, movie_content2, movie_content3, movie_content4)
    algo = collab_filtering()
    userscore2 = adding_col(userscore)
    naver_seen_movie = naversee_surprise(userscore2, movie_data)
    user_based_recommend = recommend_movie(algo, naver_seen_movie)