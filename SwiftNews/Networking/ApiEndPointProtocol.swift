//
//  ApiEndPointProtocol.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 14/05/24.
//

import Foundation

protocol ApiEndpointProtocol {
    var domain: String { get }
    var pathPrefix: String { get }
    var path: String { get }
    var body: Data? { get }
    var method: HTTPMethod { get }
    var query: [String: String]? { get }
}
