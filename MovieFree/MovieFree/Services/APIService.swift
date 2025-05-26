//
//  APIService.swift
//  MovieFree
//
//  Created by Alex Tran on 23/4/25.
//

import Foundation


class APIService {
   
    func fetchGenres(completion: @escaping (Result<[Genre], Error>) -> Void){
        guard let url =  URL(string: apiGenre) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let genreResponse = try decoder.decode(GenreResponse.self, from: data)
                completion(.success(genreResponse.genres))
            } catch {
                completion(.failure(error))
            }
        
        }
        task.resume()
    }
    
    func fetchMoviesOfGenre(withID idGenre:Int, withPage page:Int = 1,completion: @escaping (Result<[Movie], Error>) -> Void){
        let urlString = "\(apiMoviesOfGenre)\(idGenre)&page=\(page)"
        guard let url =  URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movieResponse = try decoder.decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(error))
            }
        
        }
        task.resume()
    }
    
    func fetchMovieDetail(movieID:Int,language: String = "vi-VN",completion: @escaping (Result<MovieDetail,Error>) -> Void) {
        
        let urlString = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)&language=\(movieID)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response , error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let detailMovie = try decoder.decode(MovieDetail.self, from: data)
                completion(.success(detailMovie))
            }
            catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
    
}
