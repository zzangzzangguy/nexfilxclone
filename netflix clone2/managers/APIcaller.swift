//
//  APIcaller.swift
//  netflix clone2
//
//  Created by 김기현 on 2023/02/03.
//

import Foundation

struct Constants {
    static let API_KEY = "a6b0840f22366aa6a6b6da9a2226a5ca"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData

}
class APIcaller {
    static let shared = APIcaller()



    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/moive/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))

            } catch {
                completion(.failure(APIError.failedTogetData))
            }

        }

        task.resume()
    }



    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
                
            }
        }

        task.resume()
    }

    func getupcomingMoives(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))

            }


        }
        task.resume()

    }

    func getpopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))

            }
        }

        task.resume()
    }


    func getTopRadted(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _,error in
            guard let data = data, error == nil else {
            return
        }

            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)

            } catch {
                completion(.failure(APIError.failedTogetData))

            }



        }
        task.resume()
    }
}




        // https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1



