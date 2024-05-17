//
//  NewsNetworkingServiceProtocol.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 14/05/24.
//

import Foundation

protocol NewsNetworkingServiceProtocol {
    func getTopHeadlinesByCategory(category: String, pageSize: Int, page: Int) async -> Result<ArticleListResponse, Error> 
}
