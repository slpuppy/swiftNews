//
//  ArticleListResponseParser.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

class NewsParser: NewsParserProtocol {
    func parseNewsData(data: Data) throws -> ArticleListResponse  {
        return try JSONDecoder().decode(ArticleListResponse.self, from: data)
    }
}
