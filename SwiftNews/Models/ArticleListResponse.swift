//
//  NewsList.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

struct ArticleListResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]?
}
