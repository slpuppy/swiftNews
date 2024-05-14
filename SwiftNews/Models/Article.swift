//
//  NewsItem.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation


struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    var publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}
    

