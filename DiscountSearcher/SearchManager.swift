//
//  SearcherManager.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/4/24.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit
import CoreLocation

class SearchManager : NSObject, CLLocationManagerDelegate, SearchProtocol
{
    var searchers = Array<Searcher>()
    let locationManager : CLLocationManager = CLLocationManager()
    var metaData : SearchMetaData = SearchMetaData()
    
    init(keyword: String, type: AnyObject)
    {
        super.init()
        locationManager.delegate = self
        self.metaData.keyword = keyword
        self.metaData.type = type
    }

    func openApp(keyword: String, url: URL)
    {
        
    }
    
    func configureMetaData()
    {
        getLocation()
    }
    
    func getLocation()
    {
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus ==  .restricted || authStatus == .denied
        {
            print("app is not permitted to use location services")
            return
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100
        locationManager.requestLocation()
    }
    
    //TODO: needs request permition?
    //TODO: what if locate fails
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let currLocation = locations.last!
        metaData.location = currLocation
    }
    
    func initSearchers()
    {
        let meituan = MeituanSearcher(metaData: metaData)
        searchers.append(meituan)
        let bankcomm = BankCommSearcher(metaData: metaData)
        searchers.append(bankcomm)
    }
    
    func search(metaData: SearchMetaData)
    {
        //use dispatch to improve performance
    }
    
    func cancel()
    {
        for searcher in searchers {
            searcher.cancel()
        }
    }
    
    func searcher(_ searcher: Searcher, didFinishSearchingWithResults searchResults: AnyObject)
    {
        print(searchResults)
        
    }
}
