def load_movie_code():
    import csv

    with open('../data-files/movie_list_result.csv', newline='', encoding="utf-8") as f:
        reader = csv.DictReader(f)

        # 영화코드를 담을 빈 리스트 생성
        movieCd_lists = []

        # 영화코드 한줄씩 읽어 리스트에 담기
        for row in reader:
            movieCd_lists.append(row['movieCd'])

    return movieCd_lists

def load_movie_detail_from_api_server(movieCd):
    import requests

    key = 'b6f17d97d70b04df11c24a3584b7c19b'
    url = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key={0}&movieCd={1}'.format(key, movieCd)
    print(url)

    response = requests.get(url).json()

    # movie_info_detail.append(json.loads(response)['movieInfoResult'])
    movieInfo = response['movieInfoResult']["movieInfo"]

    return movieInfo

def load_movie_details(movieCd_list):
    import pandas as pd

    movie_info_detail=[]
    for movieCd in movieCd_list:
        movieInfo = load_movie_detail_from_api_server(movieCd)
        movie_info_detail.append(movieInfo);

    return pd.DataFrame(movie_info_detail)

if __name__ == "__main__":
    all_movieCd_list = load_movie_code()
    movieCd_list_to_request = all_movieCd_list[0:10]
    movie_details_df = load_movie_details(movieCd_list_to_request)
    print(movie_details_df)