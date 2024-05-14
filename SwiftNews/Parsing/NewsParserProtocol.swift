//
//  NewsParserProtocol.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 14/05/24.
//

import Foundation

protocol NewsParserProtocol {
    func parseNewsData(data: Data) throws -> ArticleListResponse
}
