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
    
    //Chinese is not allowed in building an URL, otherwise it will return nil
    private var requestURL = [
                              //String(describing: MeituanSearcher.self):URL(string: "http://www.dianping.com/search/category/7/10/g103")!,
//                              String(describing: MeituanSearcher.self):URL(string: "http://api.union.meituan.com/data/api?city=杭州&category=美食&limit=100&district_name=萧山区&key=c6d3fd8c667c3cc4ecd1ef83337e15e7993&keyword=火锅&sort=1")!,
                              String(describing: NuomiSearcher.self):URL(string: "http://api.nuomi.com/api/dailydeal?version=v1&city=shenzhen")!,
                              String(describing: BankCommSearcher.self):URL(string: "https://creditcardapp.bankcomm.com/food/store/search.json?")!]
    
     func getConfigs(searcher:Searcher, type: AnyObject) -> URL?
    {
        return requestURL[String(describing: type(of: searcher))]
    }
    
}
