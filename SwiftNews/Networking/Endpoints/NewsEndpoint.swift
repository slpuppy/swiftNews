//
//  News.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

enum NewsEndpoint: ApiEndpointProtocol {
    
    case everything(String)
    case topHeadlinesByCountry(String, String, Int, Int)
    
    var path: String {
        switch self {
        case .everything:
           return "everything"
        case .topHeadlinesByCountry:
            return "top-headlines"
        }
    }
    
    var query: [String : String]? {
        switch self {
        case let .everything(everything):
            return ["everything": everything]
        case let .topHeadlinesByCountry(category, country, pageSize, page):
            return ["category": category, "country" : country, "pageSize" : "\(pageSize)", "page" : "\(page)"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .everything, .topHeadlinesByCountry:
            return .get
        }
    }
}
