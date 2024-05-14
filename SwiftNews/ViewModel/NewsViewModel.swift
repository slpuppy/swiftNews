//
//  NewsViewModel.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

protocol NewsViewModelProtocol {
    var articles: [Article]? { get }
    var selectedCategory: NewsCategory { get }
    var categories: [NewsCategory] { get }
    func getNews(completion: @escaping (Result<[Article], Error>) -> Void)
    func loadMoreNews(completion: @escaping (Result<[Article], Error>) -> Void)
    func selectCategory(category: NewsCategory)
}

class NewsViewModel: NewsViewModelProtocol {
    
    let networkingService: NewsNetworkingServiceProtocol?
    
    var articles: [Article]?
    
    var categories: [NewsCategory] = [.business, .entertainment, .health, .science, .sports, .tech]
    
    var selectedCategory = NewsCategory.business
    
    private var currentPage: Int = 1
    private var pageSize: Int = 20
    
    var location: String = "us"
    
    init(networkingService: NewsNetworkingServiceProtocol = NewsNetworkingService()) {
        self.networkingService = networkingService
    }
    
    func getNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        Task {
            do {
                let newsList = try await networkingService?.getTopHeadlinesByCategoryForLocation(category: selectedCategory.rawValue, location: location, pageSize: 20, page: currentPage)
                guard let articles = newsList?.articles else { return }
                self.articles = articles
                filterImagelessArticles()
                filterDescriptionlessArticles()
                formatNewsTitle()
                completion(.success(articles))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func loadMoreNews(completion: @escaping (Result<[Article], Error>) -> Void) {
           Task {
               do {
                   currentPage += 1
                   let newsList = try await networkingService?.getTopHeadlinesByCategoryForLocation(category: selectedCategory.rawValue, location: location, pageSize: pageSize, page: currentPage)
                   guard let newArticles = newsList?.articles else { return }
                   
        
                   self.articles?.append(contentsOf: newArticles)
                   
                   filterImagelessArticles()
                   filterDescriptionlessArticles()
                   formatNewsTitle()
                   
                   completion(.success(newArticles))
               } catch {
                   currentPage -= 1 
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
    
    private func formatNewsTitle() {
        articles = articles?.map { article in
            var components = article.title.components(separatedBy: " - ")
            if components.count > 1 {
                components.removeLast()
            }
            let formattedTitle = components[0]
            var formattedArticle = article
            formattedArticle.title = formattedTitle
            return formattedArticle
        }
    }
    
    func selectCategory(category: NewsCategory) {
        self.selectedCategory = category
    }

    
    
}
