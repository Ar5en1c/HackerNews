//
//  Constants.swift
//  HackerNews
//
//  Created by Kuldeep Singh on 6/25/24.
//

import Foundation

enum Constants: String {
    case newUrl = "https://hn.algolia.com/api/v1/search?tags=front_page"
}

enum FetchError: Error {
    case invalidURL
    case decodingFailed(Error)
}
