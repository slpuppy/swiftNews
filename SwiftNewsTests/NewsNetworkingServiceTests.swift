//
//  ResponseDTOTests.swift
//  SwiftNewsTests
//
//  Created by Gabriel Puppi on 13/05/24.
//

import XCTest
@testable import SwiftNews

final class NewsNetworkingServiceTests: XCTestCase {
    
    var sut: NewsNetworkingService!

    override func setUpWithError() throws {
        sut = NewsNetworkingService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getTopHeadlinesByCategory_shouldReturn20ArticleList() async throws {
        let uut =  await sut.getTopHeadlinesByCategory(category: NewsCategory.entertainment.rawValue, pageSize: 20, page: 1)
        
        switch uut {
        case .success(let uut):
            XCTAssertEqual("ok", uut.status)
            XCTAssertEqual(20, uut.articles?.count)
        case .failure(let failure):
            XCTFail("Expected to success but failed")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
