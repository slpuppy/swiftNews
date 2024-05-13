//
//  ResponseDTOTests.swift
//  SwiftNewsTests
//
//  Created by Gabriel Puppi on 13/05/24.
//

import XCTest
@testable import SwiftNews

final class NewsNetworkingServiceTests: XCTestCase {
    
    var service: NewsNetworkingService!

    override func setUpWithError() throws {
        service = NewsNetworkingService()
        
    }

    override func tearDownWithError() throws {
        service = nil
    }

    func test_getTopHeadlinesByCategoryForLocation_shouldReturnArticleList() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
