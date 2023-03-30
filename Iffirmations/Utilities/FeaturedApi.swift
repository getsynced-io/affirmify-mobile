//
//  FeaturedApi.swift
//  Iffirmations
//
//  Created by Fares Cherni on 13/03/2023.
//

import Foundation

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
    private let baseURLString = "https://affirmify-backend-production.up.railway.app"
    private let token = "32c4cea1ed52695e298c7ad555a9b0541364c12d3dbff6ec247885c47bd922f8"
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
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
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
