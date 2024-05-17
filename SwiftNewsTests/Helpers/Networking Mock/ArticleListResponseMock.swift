//
//  ArticleListResponseMock.swift
//  SwiftNewsTests
//
//  Created by Gabriel Puppi on 16/05/24.
//
@testable import SwiftNews

import Foundation

enum ArticleListResponseMock {
    
    static let response: [ArticleListResponse] = [
        ArticleListResponse(status: "ok", totalResults: 100, articles: [
            Article(source: Source(id: "1", name: "Source 1 Page 1"), author: "Author 1 Page 1", title: "Title 1 Page 1", description: "Description 1 Page 1", url: "URL 1 Page 1", urlToImage: "URLToImage 1 Page 1", publishedAt: "PublishedAt 1 Page 1", content: "Content 1 Page 1"),
            Article(source: Source(id: "2", name: "Source 2 Page 1"), author: "Author 2 Page 1", title: "Title 2 Page 1", description: "Description 2 Page 1", url: "URL 2 Page 1", urlToImage: "URLToImage 2 Page 1", publishedAt: "PublishedAt 2 Page 1", content: "Content 2 Page 1"),
            Article(source: Source(id: "3", name: "Source 3 Page 1"), author: "Author 3 Page 1", title: "Title 3 Page 1", description: "Description 3 Page 1", url: "URL 3 Page 1", urlToImage: "URLToImage 3 Page 1", publishedAt: "PublishedAt 3 Page 1", content: "Content 3 Page 1"),
            Article(source: Source(id: "4", name: "Source 4 Page 1"), author: "Author 4 Page 1", title: "Title 4 Page 1", description: "Description 4 Page 1", url: "URL 4 Page 1", urlToImage: "URLToImage 4 Page 1", publishedAt: "PublishedAt 4 Page 1", content: "Content 4 Page 1"),
            Article(source: Source(id: "5", name: "Source 5 Page 1"), author: "Author 5 Page 1", title: "Title 5 Page 1", description: "Description 5 Page 1", url: "URL 5 Page 1", urlToImage: "URLToImage 5 Page 1", publishedAt: "PublishedAt 5 Page 1", content: "Content 5 Page 1"),
            Article(source: Source(id: "6", name: "Source 6 Page 1"), author: "Author 6 Page 1", title: "Title 6 Page 1", description: "Description 6 Page 1", url: "URL 6 Page 1", urlToImage: "URLToImage 6 Page 1", publishedAt: "PublishedAt 6 Page 1", content: "Content 6 Page 1"),
            Article(source: Source(id: "7", name: "Source 7 Page 1"), author: "Author 7 Page 1", title: "Title 7 Page 1", description: "Description 7 Page 1", url: "URL 7 Page 1", urlToImage: "URLToImage 7 Page 1", publishedAt: "PublishedAt 7 Page 1", content: "Content 7 Page 1"),
            Article(source: Source(id: "8", name: "Source 8 Page 1"), author: "Author 8 Page 1", title: "Title 8 Page 1", description: "Description 8 Page 1", url: "URL 8 Page 1", urlToImage: "URLToImage 8 Page 1", publishedAt: "PublishedAt 8 Page 1", content: "Content 8 Page 1"),
            Article(source: Source(id: "9", name: "Source 9 Page 1"), author: "Author 9 Page 1", title: "Title 9 Page 1", description: "Description 9 Page 1", url: "URL 9 Page 1", urlToImage: "URLToImage 9 Page 1", publishedAt: "PublishedAt 9 Page 1", content: "Content 9 Page 1"),
            Article(source: Source(id: "10", name: "Source 10 Page 1"), author: "Author 10 Page 1", title: "Title 10 Page 1", description: "Description 10 Page 1", url: "URL 10 Page 1", urlToImage: "URLToImage 10 Page 1", publishedAt: "PublishedAt 10 Page 1", content: "Content 10 Page 1"),
            Article(source: Source(id: "11", name: "Source 11 Page 1"), author: "Author 11 Page 1", title: "Title 11 Page 1", description: "Description 11 Page 1", url: "URL 11 Page 1", urlToImage: "URLToImage 11 Page 1", publishedAt: "PublishedAt 11 Page 1", content: "Content 11 Page 1"),
            Article(source: Source(id: "12", name: "Source 12 Page 1"), author: "Author 12 Page 1", title: "Title 12 Page 1", description: "Description 12 Page 1", url: "URL 12 Page 1", urlToImage: "URLToImage 12 Page 1", publishedAt: "PublishedAt 12 Page 1", content: "Content 12 Page 1"),
            Article(source: Source(id: "13", name: "Source 13 Page 1"), author: "Author 13 Page 1", title: "Title 13 Page 1", description: "Description 13 Page 1", url: "URL 13 Page 1", urlToImage: "URLToImage 13 Page 1", publishedAt: "PublishedAt 13 Page 1", content: "Content 13 Page 1"),
            Article(source: Source(id: "14", name: "Source 14 Page 1"), author: "Author 14 Page 1", title: "Title 14 Page 1", description: "Description 14 Page 1", url: "URL 14 Page 1", urlToImage: "URLToImage 14 Page 1", publishedAt: "PublishedAt 14 Page 1", content: "Content 14 Page 1"),
            Article(source: Source(id: "15", name: "Source 15 Page 1"), author: "Author 15 Page 1", title: "Title 15 Page 1", description: "Description 15 Page 1", url: "URL 15 Page 1", urlToImage: "URLToImage 15 Page 1", publishedAt: "PublishedAt 15 Page 1", content: "Content 15 Page 1"),
            Article(source: Source(id: "16", name: "Source 16 Page 1"), author: "Author 16 Page 1", title: "Title 16 Page 1", description: "Description 16 Page 1", url: "URL 16 Page 1", urlToImage: "URLToImage 16 Page 1", publishedAt: "PublishedAt 16 Page 1", content: "Content 16 Page 1"),
            Article(source: Source(id: "17", name: "Source 17 Page 1"), author: "Author 17 Page 1", title: "Title 17 Page 1", description: "Description 17 Page 1", url: "URL 17 Page 1", urlToImage: "URLToImage 17 Page 1", publishedAt: "PublishedAt 17 Page 1", content: "Content 17 Page 1"),
            Article(source: Source(id: "18", name: "Source 18 Page 1"), author: "Author 18 Page 1", title: "Title 18 Page 1", description: "Description 18 Page 1", url: "URL 18 Page 1", urlToImage: "URLToImage 18 Page 1", publishedAt: "PublishedAt 18 Page 1", content: "Content 18 Page 1"),
            Article(source: Source(id: "19", name: "Source 19 Page 1"), author: "Author 19 Page 1", title: "Title 19 Page 1", description: "Description 19 Page 1", url: "URL 19 Page 1", urlToImage: "URLToImage 19 Page 1", publishedAt: "PublishedAt 19 Page 1", content: "Content 19 Page 1"),
            Article(source: Source(id: "20", name: "Source 20 Page 1"), author: "Author 20 Page 1", title: "Title 20 Page 1", description: "Description 20 Page 1", url: "URL 20 Page 1", urlToImage: "URLToImage 20 Page 1", publishedAt: "PublishedAt 20 Page 1", content: "Content 20 Page 1"),
        ]),
        ArticleListResponse(status: "ok", totalResults: 100, articles: [
            Article(source: Source(id: "1", name: "Source 1 Page 1"), author: "Author 1 Page 1", title: "Title 1 Page 1", description: "Description 1 Page 1", url: "URL 1 Page 1", urlToImage: "URLToImage 1 Page 1", publishedAt: "PublishedAt 1 Page 1", content: "Content 1 Page 1"),
            Article(source: Source(id: "2", name: "Source 2 Page 1"), author: "Author 2 Page 1", title: "Title 2 Page 1", description: "Description 2 Page 1", url: "URL 2 Page 1", urlToImage: "URLToImage 2 Page 1", publishedAt: "PublishedAt 2 Page 1", content: "Content 2 Page 1"),
            Article(source: Source(id: "3", name: "Source 3 Page 1"), author: "Author 3 Page 1", title: "Title 3 Page 1", description: "Description 3 Page 1", url: "URL 3 Page 1", urlToImage: "URLToImage 3 Page 1", publishedAt: "PublishedAt 3 Page 1", content: "Content 3 Page 1"),
            Article(source: Source(id: "4", name: "Source 4 Page 1"), author: "Author 4 Page 1", title: "Title 4 Page 1", description: "Description 4 Page 1", url: "URL 4 Page 1", urlToImage: "URLToImage 4 Page 1", publishedAt: "PublishedAt 4 Page 1", content: "Content 4 Page 1"),
            Article(source: Source(id: "5", name: "Source 5 Page 1"), author: "Author 5 Page 1", title: "Title 5 Page 1", description: "Description 5 Page 1", url: "URL 5 Page 1", urlToImage: "URLToImage 5 Page 1", publishedAt: "PublishedAt 5 Page 1", content: "Content 5 Page 1"),
            Article(source: Source(id: "6", name: "Source 6 Page 1"), author: "Author 6 Page 1", title: "Title 6 Page 1", description: "Description 6 Page 1", url: "URL 6 Page 1", urlToImage: "URLToImage 6 Page 1", publishedAt: "PublishedAt 6 Page 1", content: "Content 6 Page 1"),
            Article(source: Source(id: "7", name: "Source 7 Page 1"), author: "Author 7 Page 1", title: "Title 7 Page 1", description: "Description 7 Page 1", url: "URL 7 Page 1", urlToImage: "URLToImage 7 Page 1", publishedAt: "PublishedAt 7 Page 1", content: "Content 7 Page 1"),
            Article(source: Source(id: "8", name: "Source 8 Page 1"), author: "Author 8 Page 1", title: "Title 8 Page 1", description: "Description 8 Page 1", url: "URL 8 Page 1", urlToImage: "URLToImage 8 Page 1", publishedAt: "PublishedAt 8 Page 1", content: "Content 8 Page 1"),
            Article(source: Source(id: "9", name: "Source 9 Page 1"), author: "Author 9 Page 1", title: "Title 9 Page 1", description: "Description 9 Page 1", url: "URL 9 Page 1", urlToImage: "URLToImage 9 Page 1", publishedAt: "PublishedAt 9 Page 1", content: "Content 9 Page 1"),
            Article(source: Source(id: "10", name: "Source 10 Page 1"), author: "Author 10 Page 1", title: "Title 10 Page 1", description: "Description 10 Page 1", url: "URL 10 Page 1", urlToImage: "URLToImage 10 Page 1", publishedAt: "PublishedAt 10 Page 1", content: "Content 10 Page 1"),
            Article(source: Source(id: "11", name: "Source 11 Page 1"), author: "Author 11 Page 1", title: "Title 11 Page 1", description: "Description 11 Page 1", url: "URL 11 Page 1", urlToImage: "URLToImage 11 Page 1", publishedAt: "PublishedAt 11 Page 1", content: "Content 11 Page 1"),
            Article(source: Source(id: "12", name: "Source 12 Page 1"), author: "Author 12 Page 1", title: "Title 12 Page 1", description: "Description 12 Page 1", url: "URL 12 Page 1", urlToImage: "URLToImage 12 Page 1", publishedAt: "PublishedAt 12 Page 1", content: "Content 12 Page 1"),
            Article(source: Source(id: "13", name: "Source 13 Page 1"), author: "Author 13 Page 1", title: "Title 13 Page 1", description: "Description 13 Page 1", url: "URL 13 Page 1", urlToImage: "URLToImage 13 Page 1", publishedAt: "PublishedAt 13 Page 1", content: "Content 13 Page 1"),
            Article(source: Source(id: "14", name: "Source 14 Page 1"), author: "Author 14 Page 1", title: "Title 14 Page 1", description: "Description 14 Page 1", url: "URL 14 Page 1", urlToImage: "URLToImage 14 Page 1", publishedAt: "PublishedAt 14 Page 1", content: "Content 14 Page 1"),
            Article(source: Source(id: "15", name: "Source 15 Page 1"), author: "Author 15 Page 1", title: "Title 15 Page 1", description: "Description 15 Page 1", url: "URL 15 Page 1", urlToImage: "URLToImage 15 Page 1", publishedAt: "PublishedAt 15 Page 1", content: "Content 15 Page 1"),
            Article(source: Source(id: "16", name: "Source 16 Page 1"), author: "Author 16 Page 1", title: "Title 16 Page 1", description: "Description 16 Page 1", url: "URL 16 Page 1", urlToImage: "URLToImage 16 Page 1", publishedAt: "PublishedAt 16 Page 1", content: "Content 16 Page 1"),
            Article(source: Source(id: "17", name: "Source 17 Page 1"), author: "Author 17 Page 1", title: "Title 17 Page 1", description: "Description 17 Page 1", url: "URL 17 Page 1", urlToImage: "URLToImage 17 Page 1", publishedAt: "PublishedAt 17 Page 1", content: "Content 17 Page 1"),
            Article(source: Source(id: "18", name: "Source 18 Page 1"), author: "Author 18 Page 1", title: "Title 18 Page 1", description: "Description 18 Page 1", url: "URL 18 Page 1", urlToImage: "URLToImage 18 Page 1", publishedAt: "PublishedAt 18 Page 1", content: "Content 18 Page 1"),
            Article(source: Source(id: "19", name: "Source 19 Page 1"), author: "Author 19 Page 1", title: "Title 19 Page 1", description: "Description 19 Page 1", url: "URL 19 Page 1", urlToImage: "URLToImage 19 Page 1", publishedAt: "PublishedAt 19 Page 1", content: "Content 19 Page 1"),
            Article(source: Source(id: "20", name: "Source 20 Page 1"), author: "Author 20 Page 1", title: "Title 20 Page 1", description: "Description 20 Page 1", url: "URL 20 Page 1", urlToImage: "URLToImage 20 Page 1", publishedAt: "PublishedAt 20 Page 1", content: "Content 20 Page 1"),
        ]),
        ArticleListResponse(status: "ok", totalResults: 100, articles: [
            Article(source: Source(id: "21", name: "Source 1 Page 2"), author: "Author 1 Page 2", title: "Title 1 Page 2", description: "Description 1 Page 2", url: "URL 1 Page 2", urlToImage: "URLToImage 1 Page 2", publishedAt: "PublishedAt 1 Page 2", content: "Content 1 Page 2"),
            Article(source: Source(id: "22", name: "Source 2 Page 2"), author: "Author 2 Page 2", title: "Title 2 Page 2", description: "Description 2 Page 2", url: "URL 2 Page 2", urlToImage: "URLToImage 2 Page 2", publishedAt: "PublishedAt 2 Page 2", content: "Content 2 Page 2"),
            Article(source: Source(id: "23", name: "Source 3 Page 2"), author: "Author 3 Page 2", title: "Title 3 Page 2", description: "Description 3 Page 2", url: "URL 3 Page 2", urlToImage: "URLToImage 3 Page 2", publishedAt: "PublishedAt 3 Page 2", content: "Content 3 Page 2"),
            Article(source: Source(id: "24", name: "Source 4 Page 2"), author: "Author 4 Page 2", title: "Title 4 Page 2", description: "Description 4 Page 2", url: "URL 4 Page 2", urlToImage: "URLToImage 4 Page 2", publishedAt: "PublishedAt 4 Page 2", content: "Content 4 Page 2"),
            Article(source: Source(id: "25", name: "Source 5 Page 2"), author: "Author 5 Page 2", title: "Title 5 Page 2", description: "Description 5 Page 2", url: "URL 5 Page 2", urlToImage: "URLToImage 5 Page 2", publishedAt: "PublishedAt 5 Page 2", content: "Content 5 Page 2"),
            Article(source: Source(id: "26", name: "Source 6 Page 2"), author: "Author 6 Page 2", title: "Title 6 Page 2", description: "Description 6 Page 2", url: "URL 6 Page 2", urlToImage: "URLToImage 6 Page 2", publishedAt: "PublishedAt 6 Page 2", content: "Content 6 Page 2"),
            Article(source: Source(id: "27", name: "Source 7 Page 2"), author: "Author 7 Page 2", title: "Title 7 Page 2", description: "Description 7 Page 2", url: "URL 7 Page 2", urlToImage: "URLToImage 7 Page 2", publishedAt: "PublishedAt 7 Page 2", content: "Content 7 Page 2"),
            Article(source: Source(id: "28", name: "Source 8 Page 2"), author: "Author 8 Page 2", title: "Title 8 Page 2", description: "Description 8 Page 2", url: "URL 8 Page 2", urlToImage: "URLToImage 8 Page 2", publishedAt: "PublishedAt 8 Page 2", content: "Content 8 Page 2"),
            Article(source: Source(id: "29", name: "Source 9 Page 2"), author: "Author 9 Page 2", title: "Title 9 Page 2", description: "Description 9 Page 2", url: "URL 9 Page 2", urlToImage: "URLToImage 9 Page 2", publishedAt: "PublishedAt 9 Page 2", content: "Content 9 Page 2"),
            Article(source: Source(id: "30", name: "Source 10 Page 2"), author: "Author 10 Page 2", title: "Title 10 Page 2", description: "Description 10 Page 2", url: "URL 10 Page 2", urlToImage: "URLToImage 10 Page 2", publishedAt: "PublishedAt 10 Page 2", content: "Content 10 Page 2"),
            Article(source: Source(id: "31", name: "Source 11 Page 2"), author: "Author 11 Page 2", title: "Title 11 Page 2", description: "Description 11 Page 2", url: "URL 11 Page 2", urlToImage: "URLToImage 11 Page 2", publishedAt: "PublishedAt 11 Page 2", content: "Content 11 Page 2"),
            Article(source: Source(id: "32", name: "Source 12 Page 2"), author: "Author 12 Page 2", title: "Title 12 Page 2", description: "Description 12 Page 2", url: "URL 12 Page 2", urlToImage: "URLToImage 12 Page 2", publishedAt: "PublishedAt 12 Page 2", content: "Content 12 Page 2"),
            Article(source: Source(id: "33", name: "Source 13 Page 2"), author: "Author 13 Page 2", title: "Title 13 Page 2", description: "Description 13 Page 2", url: "URL 13 Page 2", urlToImage: "URLToImage 13 Page 2", publishedAt: "PublishedAt 13 Page 2", content: "Content 13 Page 2"),
            Article(source: Source(id: "34", name: "Source 14 Page 2"), author: "Author 14 Page 2", title: "Title 14 Page 2", description: "Description 14 Page 2", url: "URL 14 Page 2", urlToImage: "URLToImage 14 Page 2", publishedAt: "PublishedAt 14 Page 2", content: "Content 14 Page 2"),
            Article(source: Source(id: "35", name: "Source 15 Page 2"), author: "Author 15 Page 2", title: "Title 15 Page 2", description: "Description 15 Page 2", url: "URL 15 Page 2", urlToImage: "URLToImage 15 Page 2", publishedAt: "PublishedAt 15 Page 2", content: "Content 15 Page 2"),
            Article(source: Source(id: "36", name: "Source 16 Page 2"), author: "Author 16 Page 2", title: "Title 16 Page 2", description: "Description 16 Page 2", url: "URL 16 Page 2", urlToImage: "URLToImage 16 Page 2", publishedAt: "PublishedAt 16 Page 2", content: "Content 16 Page 2"),
            Article(source: Source(id: "37", name: "Source 17 Page 2"), author: "Author 17 Page 2", title: "Title 17 Page 2", description: "Description 17 Page 2", url: "URL 17 Page 2", urlToImage: "URLToImage 17 Page 2", publishedAt: "PublishedAt 17 Page 2", content: "Content 17 Page 2"),
            Article(source: Source(id: "38", name: "Source 18 Page 2"), author: "Author 18 Page 2", title: "Title 18 Page 2", description: "Description 18 Page 2", url: "URL 18 Page 2", urlToImage: "URLToImage 18 Page 2", publishedAt: "PublishedAt 18 Page 2", content: "Content 18 Page 2"),
            Article(source: Source(id: "39", name: "Source 19 Page 2"), author: "Author 19 Page 2", title: "Title 19 Page 2", description: "Description 19 Page 2", url: "URL 19 Page 2", urlToImage: "URLToImage 19 Page 2", publishedAt: "PublishedAt 19 Page 2", content: "Content 19 Page 2"),
            Article(source: Source(id: "40", name: "Source 20 Page 2"), author: "Author 20 Page 2", title: "Title 20 Page 2", description: "Description 20 Page 2", url: "URL 20 Page 2", urlToImage: "URLToImage 20 Page 2", publishedAt: "PublishedAt 20 Page 2", content: "Content 20 Page 2"),
        ])
    ]
}
