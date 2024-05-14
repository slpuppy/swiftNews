//
//  ResponseDTOTests.swift
//  SwiftNewsTests
//
//  Created by Gabriel Puppi on 13/05/24.
//

import XCTest
@testable import SwiftNews

final class NewsNetworkingServiceTests: XCTestCase {
    
    // system under test
    var sut: NewsNetworkingService!

    override func setUpWithError() throws {
        sut = NewsNetworkingService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getTopHeadlinesByCategoryForLocation_shouldReturnArticleList() async throws {
        let uut = try await sut.getTopHeadlinesByCategoryForLocation(category: NewsCategory.entertainment.rawValue, location: "us")
        
        XCTAssertEqual("ok", uut.status)
        XCTAssertEqual(20, uut.articles?.count)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
