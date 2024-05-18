//
//  News.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

enum NewsEndpoint: ApiEndpointProtocol {
    
    case topHeadlinesByCategory(String, Int, Int)
    
    var path: String {
        switch self {
        case .topHeadlinesByCategory:
            return "top-headlines"
        }
    }
    
    var query: [String : String]? {
        switch self {
        case let .topHeadlinesByCategory(category, pageSize, page):
            return ["category": category, "pageSize" : "\(pageSize)", "page" : "\(page)", "country" : "us"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case  .topHeadlinesByCategory:
            return .get
        }
    }
}
