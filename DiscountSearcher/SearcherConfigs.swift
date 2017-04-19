//
//  SearcherConfigs.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/4/19.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit

final class SearcherConfigs: NSObject
{
    static let sharedInstance: SearcherConfigs = {
        let instance = SearcherConfigs()
        
        // setup code
        
        return instance
    }()
    
    private override init() {}
    
    private var requestURL = [String(describing: MeituanSearcher.self):URL(string: "http://www.dianping.com/search/category/7/10/g103")!]
    
     func getConfigs(searcher:Searcher, type: AnyObject) -> URL?
    {
        return requestURL[String(describing: type(of: searcher))]
    }
    
}
