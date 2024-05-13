//
//  News.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

enum NewsEndpoint: ApiEndpoint {
    
    case everything(String)
    case topHeadlinesByCountry(String, String)
    case topHeadlinesWorldwide(String)
    
    var path: String {
        switch self {
        case .everything:
           return "everything"
        case .topHeadlinesByCountry, .topHeadlinesWorldwide:
            return "top-headlines"
        }
    }
    
    var query: [String : String]? {
        switch self {
        case let .everything(everything):
            return ["everything": everything]
        case let .topHeadlinesByCountry(category, country):
            return ["category": category, "country" : country]
        case let .topHeadlinesWorldwide(category):
            return ["category": category]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .everything, .topHeadlinesByCountry, .topHeadlinesWorldwide:
            return .get
        }
    }
}
