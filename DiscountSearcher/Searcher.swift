//
//  Searcher.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/4/19.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit

protocol SearchProtocol
{
    func searcher(_ searcher: Searcher, didFinishSearchingWithResults searchResults: AnyObject)
}

class Searcher: NSObject
{
    var delegate:SearchProtocol?
    open var requestURL: URL?
    open var searchMetaData: SearchMetaData?
    var configs = [String:AnyObject]()
    
    public var keyword : String
    public var location : Any
    public var type: AnyObject
    
    init(metaData: SearchMetaData)
    {
        self.keyword = metaData.keyword!
        self.location = metaData.location!
        self.type = metaData.type!
        self.searchMetaData = metaData
    }
    
    func getSearchConfigs()
    {
        preconditionFailure("This method must be overridden")
    }
    
    open func searchDiscount()
    {
        
    }
    
    open func cancel()
    {
        
    }
}
