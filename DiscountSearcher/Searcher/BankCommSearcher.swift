//
//  BankCommSearcher.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/5/12.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class BankCommSearcher: Searcher
{

    var cookieDict = [
                      "selCityName":"%E6%B7%B1%E5%9C%B3%E5%B8%82",
                      "selCityNo":"ZDCSMC5840",
                      
                      ]

    var paraDict = [
                    "districtId" : "",
                    "merTradingId" : "",
                    "dishsetId" : "",
                    "specialFlag" : "",
                    "sortFlag" : "",
                    "range" : "",
                    "pageIndex" : "1",
                    ]

    override func getSearchConfigs()
    {
        requestURL = SearcherConfigs.sharedInstance.getConfigs(searcher: self, type: type)
    }
    
    override func searchDiscount()
    {
        searchDiscount{data in
            self.handleResponse(data: data!)
        }
    }
    
    func searchDiscount(completionHandler: ((AnyObject?)->())?)
    {
        makeRequest()
        Alamofire.request(requestURL!, parameters : paraDict).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value
            {
                print("JSON: \(JSON)")
                completionHandler?(JSON as AnyObject)

            }
            else
            {
                completionHandler?(nil)
            }
        }
    }
    
    func makeRequest()
    {
        getSearchConfigs()
        makeCookie()
        makePara()
    }
    
    func makeCookie()
    {
        
        cookieDict["selUserLatitude"] = String(format:"%.6f",self.searchMetaData!.location!.coordinate.latitude)
        cookieDict["selUserLogtitude"] = String(format:"%.6f",self.searchMetaData!.location!.coordinate.longitude)

        let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookieDict, for: requestURL!)
        Alamofire.SessionManager.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: requestURL, mainDocumentURL: nil)
    }
    
    func makePara()
    {
        paraDict["keyword"] = self.keyword.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    override func cancel()
    {
        
    }
    
    func handleResponse(data:AnyObject)
    {
        self.delegate?.searcher(self, didFinishSearchingWithResults: data)
    }
}
