//
//  NuomiSearcher.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/5/4.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit
import Alamofire
class NuomiSearcher: Searcher
{
    override func getSearchConfigs()
    {
        requestURL = SearcherConfigs.sharedInstance.getConfigs(searcher: self, type: type)
    }
    
    override func searchDiscount()
    {
        Alamofire.request(requestURL!).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            if response.response != nil
            {
//                delegate?.searcher(self, didFinishSearchingWithResults: response.response!)
            }
        }
    }
    
    override func cancel()
    {
        
    }
}