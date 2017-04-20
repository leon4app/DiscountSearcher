//
//  SearchMetaData.swift
//  DiscountSearcher
//
//  Created by LeonTse on 2017/4/19.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit
import CoreLocation

class SearchMetaData: NSObject
{
    open var keyword: String?

    open var location: CLLocation?
    //TODO: type
    open var type: AnyObject?
}
