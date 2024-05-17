//
//  NewsNetworkingService.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

class NewsNetworkingService: NewsNetworkingServiceProtocol {
    
    let parser: NewsParserProtocol
    let session: URLSession
    
    init(parser: NewsParserProtocol = NewsParser()) {
        self.parser = parser
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        session = URLSession(configuration: configuration)
    }
    
    func getTopHeadlinesByCategory(category: String, pageSize: Int, page: Int) async -> Result<ArticleListResponse, Error> {
        let endpoint = NewsEndpoint.topHeadlinesByCategory(category, pageSize, page)
        do {
            let (data, response) = try await session.data(for: endpoint.request)
            
            if let error = handleAPIErrorResponse(data: data, response: response, error: nil) {
                return .failure(error)
            }
            
            let parsedData = try parser.parseNewsData(data: data)
            return .success(parsedData)
            
        } catch {
            if let urlError = error as? URLError, urlError.code == .timedOut {
                return .failure(APIErrorResponse(status: "408", code: "timedOut", message: "Request timed out"))
            }
            return .failure(error)
        }
    }
    
    private func handleAPIErrorResponse(data: Data?, response: URLResponse?, error: Error?) -> APIErrorResponse? {

        guard let httpResponse = response as? HTTPURLResponse else {
            return nil
        }

        guard let data = data else {
            return nil
        }

        if httpResponse.statusCode == 200 {
            return nil
        }

        do {
            let apiErrorResponse = try JSONDecoder().decode(APIErrorResponse.self, from: data)
            return apiErrorResponse
        } catch {
            return APIErrorResponse(status: "000", code: "Couldn't decode data", message: "Error while trying to decode error xD")
        }
    }
}



