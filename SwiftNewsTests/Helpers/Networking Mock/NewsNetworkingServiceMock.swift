//
//  NewsNetworkingServiceMock.swift
//  SwiftNewsTests
//
//  Created by Gabriel Puppi on 16/05/24.
//
@testable import SwiftNews

import Foundation

class NewsNetworkingServiceMock: NewsNetworkingServiceProtocol {
    
    let parser: NewsParserProtocol
    
    init(parser: NewsParserProtocol = NewsParser()) {
        self.parser = parser
    }
    
    func getTopHeadlinesByCategory(category: String, pageSize: Int, page: Int) async -> Result<ArticleListResponse, Error>  {
        return Result<ArticleListResponse, Error>.success(ArticleListResponseMock.response[page])
       }
    }



