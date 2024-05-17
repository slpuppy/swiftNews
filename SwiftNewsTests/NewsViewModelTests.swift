//
//  NewsViewModelTests.swift
//  SwiftNewsTests
//
//  Created by Gabriel Puppi on 16/05/24.
//

import XCTest
@testable import SwiftNews

final class NewsViewModelTests: XCTestCase {
    
    var viewModel: NewsViewModel!

    override func setUpWithError() throws {
        self.viewModel = NewsViewModel(networkingService: NewsNetworkingServiceMock(), coordinator: MainCoordinator(navigationController: UINavigationController()))
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }
    
    func test_loadMoreNews_shouldReturnNextPage() async throws {
          
            XCTAssertEqual(viewModel.articles.count, 0, "Initial articles count should be zero")
         
        
        let result = await viewModel.loadNews()
          switch result {
          case .success:
              XCTAssertEqual(viewModel.articles.count, 20, "Articles count after loading first page should be 20")
          case .failure(let error):
              XCTFail("Expected success, but got failure with error: \(error)")
          }
    
        let resultSecondPage = await viewModel.loadNextPage()
          switch resultSecondPage {
          case .success:
              XCTAssertEqual(viewModel.articles.count, 40, "Articles count after loading second page should be 40")
          case .failure(let error):
              XCTFail("Expected success, but got failure with error: \(error)")
          }
      }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
