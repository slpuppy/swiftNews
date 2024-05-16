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
        self.viewModel = NewsViewModel(networkingService: NewsNetworkingServiceMock())
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }
    
    
    func test_loadMoreNews_shouldReturnNextPage() {
       
        var totalArticles = 0
        let getNewsExp = expectation(description: "newsFetched")
        let loadMoreExp = expectation(description: "MoreNewsFetched")
        viewModel.getNews() { _ in
           getNewsExp.fulfill()
        }
        wait(for: [getNewsExp])
        totalArticles = self.viewModel.articles?.count ?? 0
     
        self.viewModel.loadMoreNews { result in
            switch result {
            case .success():
                loadMoreExp.fulfill()
            case .failure(let failure):
                XCTFail("Test Failed")
            }
        }
        wait(for: [loadMoreExp])
        XCTAssertGreaterThan((self.viewModel.articles!.count), totalArticles)
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
