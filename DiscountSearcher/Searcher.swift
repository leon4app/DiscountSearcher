//
//  Searcher.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/4/19.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit

class Searcher: NSObject
{
    open var requestURL: URL?
    open var searchMetaData: SearchMetaData?
    var configs = [String:AnyObject]()
    
    func getSearchConfigs()
    {
        preconditionFailure("This method must be overridden")
    }
    
    func searchDiscount()
    {
        
    }
    
    func cancel()
    {
        
    }
}
