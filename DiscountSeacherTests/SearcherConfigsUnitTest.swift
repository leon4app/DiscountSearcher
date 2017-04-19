//
//  SearcherConfigsUnitTest.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/4/19.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import XCTest
@testable import DiscountSearcher

class SearcherConfigsUnitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearcherConfigs()
    {
        let a = MeituanSearcher.init(keyword: "s", address: "s")
        let url = SearcherConfigs.sharedInstance.getConfigs(searcher: a, type: "s" as AnyObject)
        XCTAssertEqual(url, URL(string: "http://www.dianping.com/search/category/7/10/g103")!)
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
