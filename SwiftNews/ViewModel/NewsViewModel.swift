//
//  NewsViewModel.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

protocol NewsViewModelProtocol {
    var articles: [Article]? { get }
    func getWorldwideNews(completion: @escaping (Result<[Article], Error>) -> Void)
    func getNewsForLocation(completion: @escaping (Result<[Article], Error>) -> Void)
}

class NewsViewModel: NewsViewModelProtocol {
    
    let networkingService: NewsNetworkingServiceProtocol?
    
    var articles: [Article]?
    
    var category: String = "technology"
    
    var location: String = "us"
    
    init(networkingService: NewsNetworkingServiceProtocol = NewsNetworkingService()) {
        self.networkingService = networkingService
    }
    
    func getWorldwideNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        Task {
            do {
                let newsList = try await networkingService?.getTopHeadlinesByCategory(category: category)
                guard let articles = newsList?.articles else { return }
                self.articles = articles
                completion(.success(articles))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func getNewsForLocation(completion: @escaping (Result<[Article], Error>) -> Void) {
        Task {
            do {
                let newsList = try await networkingService?.getTopHeadlinesByCategoryForLocation(category: category, location: location)
                guard let articles = newsList?.articles else { return }
                self.articles = articles
                filterImagelessArticles()
                filterDescriptionlessArticles()
                completion(.success(articles))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    private func filterImagelessArticles(){
        articles = articles?.filter { $0.urlToImage != nil }
    }
    
    private func filterDescriptionlessArticles() {
        articles = articles?.filter { $0.description != nil }
    }
}
