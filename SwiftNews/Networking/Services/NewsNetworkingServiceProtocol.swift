//
//  NewsNetworkingServiceProtocol.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 14/05/24.
//

import Foundation

protocol NewsNetworkingServiceProtocol {
    func getTopHeadlinesByCategoryForLocation(category: String, location: String, pageSize: Int, page: Int) async throws -> ArticleListResponse
}
