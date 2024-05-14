//
//  ApiEndPoint.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol ApiEndpoint {
    var domain: String { get }
    var pathPrefix: String { get }
    var path: String { get }
    var body: Data? { get }
    var method: HTTPMethod { get }
    var query: [String: String]? { get }
}


