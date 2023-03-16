//
//  FeaturedApi.swift
//  Iffirmations
//
//  Created by Fares Cherni on 13/03/2023.
//

import Foundation
//
//struct Category: Codable {
//    let name: String
//    let count: Int
//}
//
//
//class FeaturedFlaskApi {
//
//    static let instance : FeaturedFlaskApi = FeaturedFlaskApi(endpoint: "https://quotefeatured-production.up.railway.app")
//    let endpoint: String
//
//    init(endpoint: String) {
//        self.endpoint = endpoint
//    }
//
//    func getBiggestCategoryCount(completion: @escaping (Result<Category, Error>) -> Void) {
//        let endpoint = "\(self.endpoint)/biggest"
//        guard let url = URL(string: endpoint) else {
//            completion(.failure(FlaskAppError.invalidURL))
//            return
//        }
//        let session = URLSession.shared
//        let task = session.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200..<300).contains(httpResponse.statusCode) else {
//                completion(.failure(FlaskAppError.invalidResponse))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(FlaskAppError.invalidData))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let category = try decoder.decode(Category.self, from: data)
//                completion(.success(category))
//            } catch {
//                completion(.failure(FlaskAppError.invalidData))
//            }
//        }
//        task.resume()
//    }
//
//    func incrementMultipleCategories(categories: [String], completion: @escaping (Result<Void, Error>) -> Void) {
//        let endpoint = "\(self.endpoint)/increment-multiple"
//        guard let url = URL(string: endpoint) else {
//            completion(.failure(FlaskAppError.invalidURL))
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        do {
//            let requestBody = try JSONSerialization.data(withJSONObject: ["categories": categories])
//            request.httpBody = requestBody
//        } catch {
//            completion(.failure(FlaskAppError.invalidRequestBody))
//            return
//        }
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200..<300).contains(httpResponse.statusCode) else {
//                completion(.failure(FlaskAppError.invalidResponse))
//                return
//            }
//            completion(.success(()))
//        }
//        task.resume()
//    }
//}
//
//enum FlaskAppError: Error {
//    case invalidURL
//    case invalidData
//    case invalidResponse
//    case invalidRequestBody
//}

import Foundation

struct Category: Codable {
    let category: String
    let count: Int
}

struct IncrementCategoryRequest: Codable {
    let categories: [String]
}

enum APIError: Error {
    case networkError(Error)
    case apiError(Int)
    case decodingError(Error)
    case invalidData
}

class APIManager {
    private let baseURLString = "https://iffirmations.herokuapp.com"
    private let token = "22f3db9538e03113707feceb8854f3514fe5729fd005fcf1abe408c0e13f18a4"
    static let shared : APIManager  = APIManager()
    func getBiggestCategory(completion: @escaping (Result<Category, APIError>) -> Void) {
        let urlString = "\(baseURLString)/biggest"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidData))
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                completion(.failure(.apiError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let category = try JSONDecoder().decode(Category.self, from: data)
                completion(.success(category))
            } catch let error {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    func incrementCategoryList(categories: [String], completion: @escaping (Result<[Category], APIError>) -> Void) {
        let urlString = "\(baseURLString)/increment_list"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        let requestBody = IncrementCategoryRequest(categories: categories)
        do {
            let requestData = try JSONEncoder().encode(requestBody)
            request.httpBody = requestData
        } catch let error {
            completion(.failure(.decodingError(error)))
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidData))
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                completion(.failure(.apiError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let categories = try JSONDecoder().decode([Category].self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
