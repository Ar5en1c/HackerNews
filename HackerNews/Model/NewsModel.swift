//
//  NewsModel.swift
//  HackerNews
//
//  Created by Kuldeep Singh on 6/25/24.
//

import Foundation


struct NewsData: Codable {
    let hits: [Hit]?
}

struct Hit: Codable {
    let author: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
}
