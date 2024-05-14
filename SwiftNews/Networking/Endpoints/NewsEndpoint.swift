//
//  News.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

enum NewsEndpoint: ApiEndpointProtocol {
    
    case everything(String)
    case topHeadlinesByCategory(String, Int, Int)
    
    var path: String {
        switch self {
        case .everything:
           return "everything"
        case .topHeadlinesByCategory:
            return "top-headlines"
        }
    }
    
    var query: [String : String]? {
        switch self {
        case let .everything(everything):
            return ["everything": everything]
        case let .topHeadlinesByCategory(category, pageSize, page):
            return ["category": category, "pageSize" : "\(pageSize)", "page" : "\(page)", "country" : "us"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .everything, .topHeadlinesByCategory:
            return .get
        }
    }
}
