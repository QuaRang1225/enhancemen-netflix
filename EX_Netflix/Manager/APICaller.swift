//
//  APICaller.swift
//  EX_Netflix
//
//  Created by 유영웅 on 8/26/24.
//

import Foundation

struct Constans{
    static let baseURL =  "https://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "")"
}
struct AllRecommend:Codable{
    let status:Int
    let data:AllRecommendResponse?
    let message:String
}
struct AllRecommendResponse: Codable {
    var preferredGenreRecommendationTv: RecommendTVList?
    var preferredGenreRecommendationMovie: RecommendMovieList?
    var userActivityRecommendationTv: RecommendTVList?
    var userActivityRecommendationMovie:RecommendMovieList?
    var userActivityRecommendationTvAnimation: RecommendTVList?
    var userActivityRecommendationMovieAnimation: RecommendMovieList?
    var popularRecommendationTv: RecommendTVList?
    var popularRecommendationMovie: RecommendMovieList?
    var topRatedRecommendationTv: RecommendTVList?
    var topRatedRecommendationMovie: RecommendMovieList?
    var trendRecommendationTv: RecommendTVList?
    var trendRecommendationMovie: RecommendMovieList?
    
    enum CodingKeys: String, CodingKey {
        case preferredGenreRecommendationTv = "preferred_genre_recommendation_tv"
        case preferredGenreRecommendationMovie = "preferred_genre_recommendation_movie"
        case userActivityRecommendationTv = "user_activity_recommendation_tv"
        case userActivityRecommendationMovie = "user_activity_recommendation_movie"
        case userActivityRecommendationTvAnimation = "user_activity_recommendation_tv_animation"
        case userActivityRecommendationMovieAnimation = "user_activity_recommendation_movie_animation"
        case popularRecommendationTv = "popular_recommendation_tv"
        case popularRecommendationMovie = "popular_recommendation_movie"
        case topRatedRecommendationTv = "top_rated_recommendation_tv"
        case topRatedRecommendationMovie = "top_rated_recommendation_movie"
        case trendRecommendationTv = "trend_recommendation_tv"
        case trendRecommendationMovie = "trend_recommendation_movie"
    }
}
struct RecommendMovieList: Codable,Hashable {
    let page, totalPages, totalResults: Int
    let results: [RecommendMovieResponse]
    let contentsID: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
        case contentsID = "contents_id"
    }
}

struct RecommendMovieResponse: Codable,Hashable {
    let id: Int
    let title: String
    let posterPath: String?
    let backdropPath:String?
    let genreIds:[Int]?
    

    enum CodingKeys: String, CodingKey {
        case id, title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
    }
}

struct RecommendTVList: Codable,Hashable {
    let page, totalPages, totalResults: Int
    let results: [RecommendTVResponse]
    let contentsID: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
        case contentsID = "contents_id"
    }
}
struct RecommendTVResponse: Codable,Hashable {
    let id: Int
    let name: String
    let posterPath: String?
    let backdropPath:String?
    let genreIds:[Int]?
    

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
    }
}
class APICaller{
    static let shaerd = APICaller()
    func getTrend(completion:@escaping (Result<(AllRecommend),Error>) -> Void){
        
        guard let url = URL(string:"\(Constans.baseURL)/api/recommend/all") else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = ["Authorization":"GUEST"]
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data,error == nil else{ return }
            do {
                let results = try JSONDecoder().decode(AllRecommend.self, from: data)
                completion(.success(results))
            } catch  {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
