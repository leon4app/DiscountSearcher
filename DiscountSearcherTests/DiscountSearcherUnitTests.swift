//
//  DiscountSearcherTests.swift
//  DiscountSearcherTests
//
//  Created by LeonTse on 2017/4/19.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import XCTest
import CoreLocation
@testable import DiscountSearcher

class DiscountSearcherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMeituanSearcher()
    {
        let searchExpectation = XCTestExpectation.init(description: "search discount")
        var metaData = SearchMetaData()
        metaData.keyword = "s"
        metaData.location = CLLocation.init(latitude: 22.528574, longitude: 113.923860)
        metaData.type = "food" as AnyObject
        let meituanSearcher = MeituanSearcher.init(metaData: metaData)
        meituanSearcher.getSearchConfigs()
        meituanSearcher.searchDiscount()
    }

    func testBankCommSearcher()
    {
        let expectation = self.expectation(description: "Load data from bank comm async")
        var metaData = SearchMetaData()
        metaData.keyword = "s"
        metaData.location = CLLocation.init(latitude: 22.528574, longitude: 113.923860)
        metaData.type = "food" as AnyObject
        let bcs = BankCommSearcher.init(metaData: metaData)
        
        bcs.searchDiscount{data in
            XCTAssertNotNil(data, "Expected non-nil string")
            print("data:")
            print(data)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    

    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
