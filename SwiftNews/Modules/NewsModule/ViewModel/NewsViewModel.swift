//
//  NewsViewModel.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import Foundation

protocol NewsViewModelProtocol {
    var articles: [Article] { get }
    var selectedCategory: NewsCategory { get }
    var categories: [NewsCategory] { get }
    func loadNews() async -> Result<Void, Error>
    func loadNextPage() async -> Result<Void, Error>
    func changeCategory(category: NewsCategory) async -> Result<Void, Error>?
    func presentArticle(articleIndex: Int)
}

class NewsViewModel: NewsViewModelProtocol {
    
    weak var coordinator: Coordinator?
    
    let networkingService: NewsNetworkingServiceProtocol
    
    var categories: [NewsCategory] = [.business, .entertainment, .health, .science, .sports, .tech]
    
    var selectedCategory: NewsCategory = .all
    
    var articles: [Article] = []
    
    private var currentPage: Int = 1
    private var pageSize: Int = 20
    
    // MARK: Initialization
    
    init(networkingService: NewsNetworkingServiceProtocol = NewsNetworkingService(), coordinator: Coordinator) {
        self.coordinator = coordinator
        self.networkingService = networkingService
    }
    
    // MARK: Public Methods
    
    func loadNews() async -> Result<Void, Error> {
        currentPage = 1
        let result = await networkingService.getTopHeadlinesByCategory(category: selectedCategory.rawValue, pageSize: pageSize, page: currentPage)
            switch result {
            case .success(let newsList):
                guard let newArticles = newsList.articles else {
                    return .failure(APIErrorResponse(status: "000", code: "No Data", message: "No data was found"))
                }
                self.articles = newArticles
                self.setupArticles()
                return .success(())
            case .failure(let error):
                return .failure(error)
            }
    }
    
    func loadNextPage() async -> Result<Void, Error> {
            currentPage += 1
        let result = await networkingService.getTopHeadlinesByCategory(category: selectedCategory.rawValue, pageSize: pageSize, page: currentPage)
            switch result {
            case .success(let newsList):
                guard let newArticles = newsList.articles else {
                    currentPage -= 1
                    return .failure(APIErrorResponse(status: "", code: "Unknown Data", message: "Unable do decode data"))
                }
                self.articles.append(contentsOf: newArticles)
                self.setupArticles()
                return .success(())
            case .failure(let error):
                currentPage -= 1
                return .failure(error)
            }
    }
    
    func changeCategory(category: NewsCategory) async -> Result<Void, Error>? {
        currentPage = 1
        if category != selectedCategory {
            self.selectedCategory = category
            let result = await networkingService.getTopHeadlinesByCategory(category: selectedCategory.rawValue, pageSize: pageSize, page: currentPage)
                switch result {
                case .success(let newsList):
                    guard let newArticles = newsList.articles else {
                        return .failure(APIErrorResponse(status: "000", code: "No Data", message: "No data was found"))
                    }
                    self.articles = newArticles
                    self.setupArticles()
                    return .success(())
                case .failure(let error):
                    return .failure(error)
                }
            }
        return nil
    }
    
    func presentArticle(articleIndex: Int){
        let article = articles[articleIndex]
        coordinator?.presentArticle(article: article)
    }
    
    // MARK: Private Methods
    
    private func setupArticles(){
        filterContentlessArticles()
        filterDescriptionlessArticles()
        filterImagelessArticles()
        formatNewsTitle()
    }
   
    private func filterImagelessArticles(){
        articles = articles.filter { $0.urlToImage != nil }
    }
    
    private func filterDescriptionlessArticles() {
        articles = articles.filter { $0.description != nil }
    }
    
    private func filterContentlessArticles() {
        articles = articles.filter { $0.content != nil }
    }
    
    private func formatNewsTitle() {
        articles = articles.map { article in
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
