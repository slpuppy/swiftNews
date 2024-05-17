//
//  NewsNetworkingError.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 16/05/24.
//

import Foundation

enum NewsNetworkingError: Error {
    case invalidURL
    case customError(String)
}
