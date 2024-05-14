//
//  NewsNetworkingService.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

class NewsNetworkingService: NewsNetworkingServiceProtocol {
    
    let parser: NewsParserProtocol
    let session: URLSession
    
    init(parser: NewsParserProtocol = NewsParser()) {
        self.parser = parser
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        session = URLSession(configuration: configuration)
    }
    
    func getTopHeadlinesByCategoryForLocation(category: String, location: String, pageSize: Int, page: Int) async throws -> ArticleListResponse {
           let endpoint = NewsEndpoint.topHeadlinesByCountry(category, location, pageSize, page)
           let (data, _) = try await session.data(for: endpoint.request)
           return try parser.parseNewsData(data: data)
       }
    }



