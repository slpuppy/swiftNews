//
//  ApiErrorResponse.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 17/05/24.
//

import Foundation

struct APIErrorResponse: Decodable, Error {
    let status: String
    let code: String?
    let message: String?
}
