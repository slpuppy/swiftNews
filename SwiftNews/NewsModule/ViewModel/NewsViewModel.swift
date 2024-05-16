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
    func presentArticle(article: Article)
}

class NewsViewModel: NewsViewModelProtocol {
    
    weak var coordinator: MainCoordinator?
    let networkingService: NewsNetworkingServiceProtocol?
    var articles: [Article]?
    var categories: [NewsCategory] = [.business, .entertainment, .health, .science, .sports, .tech]
    var selectedCategory: NewsCategory = .all
    
    private var currentPage: Int = 1
    private var pageSize: Int = 20
    

    
    init(networkingService: NewsNetworkingServiceProtocol = NewsNetworkingService()) {
        self.networkingService = networkingService
    }
    
    func getNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        Task {
            do {
                let newsList = try await networkingService?.getTopHeadlinesByCategory(category: selectedCategory.rawValue, pageSize: 20, page: currentPage)
                guard let articles = newsList?.articles else { return }
                self.articles = articles
                print(articles)
                filterImagelessArticles()
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
                   let newsList = try await networkingService?.getTopHeadlinesByCategory(category: selectedCategory.rawValue, pageSize: pageSize, page: currentPage)
                   guard let newArticles = newsList?.articles else { return }
                   self.articles?.append(contentsOf: newArticles)
                   filterContentlessArticles()
                   filterImagelessArticles()
                   formatNewsTitle()
                   completion(.success(newArticles))
               } catch {
                   currentPage -= 1 
                   completion(.failure(error))
               }
           }
       }
    
    func selectCategory(category: NewsCategory) {
        self.selectedCategory = category
    }
    
    func presentArticle(article: Article){
        coordinator?.presentArticle(article: article)
    }
   
    private func filterImagelessArticles(){
        articles = articles?.filter { $0.urlToImage != nil }
    }
    
    private func filterDescriptionlessArticles() {
        articles = articles?.filter { $0.description != nil }
    }
    
    private func filterContentlessArticles() {
        articles = articles?.filter { $0.content != nil }
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
}
