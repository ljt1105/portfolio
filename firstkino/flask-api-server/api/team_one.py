from flask import Blueprint
from flask import jsonify
from flask import make_response
import json

team_one = Blueprint('team_one', __name__)

@team_one.route("/")
def index():
    return "This is Api Service for Team One"

@team_one.route("/find-recommended-movies/<movie_name>")
def find_recommended_movies(movie_name):

    import pandas as pd
    import os
    import numpy as np

    import pickle

    from modules import contents_based_algorithm
    
    if not os.path.exists("merged_movie_contents.csv"):
        print('file not found 1')
        rows = contents_based_algorithm.load_data()
        movie_contents_merge = contents_based_algorithm.preprocessing_data(rows)
        movie_contents_merge.to_csv("merged_movie_contents.csv")
        
    movie_contents_merge = pd.read_csv("merged_movie_contents.csv")

    # director_content_sim = contents_based_algorithm.processing_movie_data(movie_contents_merge)
    if not os.path.exists("processed_director_sim.pickle"):
        print("file not found 2")
        director_content_sim = contents_based_algorithm.processing_movie_data(movie_contents_merge)
        with open("processed_director_sim.pickle", "wb") as f:
            pickle.dump(director_content_sim, f)

    with open("processed_director_sim.pickle", "rb") as f:
        director_content_sim = pickle.load(f)

    similar_movie = contents_based_algorithm.find_genre_score(movie_contents_merge, director_content_sim, movie_name, 30)
    similar_movie = similar_movie[['movieCd', 'movieNm', 'similarity', 'content']]

    response = make_response(similar_movie.to_json(orient='records'))
    response.content_type = "application/json;charset=utf-8"

    return response

@team_one.route("/predict_movie_score/<user_id>")
def predict_movie_score(user_id):
    from modules import user_based_algorithm
    import json

    movie_content = user_based_algorithm.load_movie_data()
    userscore = user_based_algorithm.load_userscore()
    movie_content1, movie_content2, movie_content3, movie_content4 = user_based_algorithm.preprocessing_movie_data(movie_content)
    movie_data = user_based_algorithm.preprocessing_sim_col(movie_content1, movie_content2, movie_content3, movie_content4)
    algo = user_based_algorithm.collab_filtering()
    userscore2 = user_based_algorithm.adding_col(userscore)
    naver_seen_movie = user_based_algorithm.naversee_surprise(userscore2, user_id, movie_data)

    user_based_recommend = user_based_algorithm.recommend_movie(algo, user_id, naver_seen_movie, movie_data)
    user_based_recommend

    # response = make_response(user_based_recommend.to_json(orient='records'))
    response = make_response(json.dumps(user_based_recommend, ensure_ascii=False))
    response.content_type = "application/json;charset=utf-8"

    return response



# @team_one.route("/demo-one")
# def demo_one() :
#     return {
#         "name": "John Doe",
#         "email": "johndoe@example.com",
#         "phone": "010-9438-4907",
#         "birth": "1990-07-23"
#     }

# @team_one.route("/demo-two")
# def demo_two() :
#     return jsonify([{
#         "name": "John Doe",
#         "email": "johndoe@example.com",
#         "phone": "010-9438-4907",
#         "birth": "1990-07-23"
#     }, {
#         "name": "홍길동",
#         "email": "hkd@example.com",
#         "phone": "010-8687-2399",
#         "birth": "1990-04-21"
#     }])

# @team_one.route("/demo-three")
# def demo_three() :
#     response = make_response(json.dumps([{
#                 "name": "John Doe",
#                 "email": "johndoe@example.com",
#                 "phone": "010-9438-4907",
#                 "birth": "1990-07-23"
#             }, {
#                 "name": "홍길동",
#                 "email": "hkd@example.com",
#                 "phone": "010-8687-2399",
#                 "birth": "1990-04-21"
#             }], ensure_ascii=False, indent=4))
#     response.content_type = "application/json;charset=utf-8"

#     return response