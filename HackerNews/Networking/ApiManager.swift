//
//  ApiManager.swift
//  HackerNews
//
//  Created by Kuldeep Singh on 6/25/24.
//

import Foundation

class ApiManager {
    
    static var shared = ApiManager()
    private init() {}
    
    func fetchDataAsJSON<T: Codable>(url: String) async throws -> T {
        guard let serverURL = URL(string: url) else {
            throw FetchError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: serverURL)
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw FetchError.decodingFailed(error)
        }
    }
}
