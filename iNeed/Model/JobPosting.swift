//
//  JobPosting.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/5/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import Foundation
import CoreLocation
import Firebase
import MapKit

struct JobPosting {
    
    var postingUser: String
    var address: String
    var description: String
    var coordinate: CLLocationCoordinate2D
    var keyword: String?
    var toolsNeeded: String?
    var hour: String?
    var category: String?
    var price: String?
    
    func values() -> [String:Any] {
        var values = [String:Any]()
        values["address"] = self.address
        values["postingUser"] = self.postingUser
        values["description"] = self.description
        values["keyword"] = self.keyword
        values["toolsNeeded"] = self.toolsNeeded
        values["hour"] = self.hour
        values["category"] = self.category
        values["price"] = self.price
        let coordinate = self.coordinate
        let coordinateArray = [coordinate.latitude as Double, coordinate.longitude as Double]
        values["coordinate"] = coordinateArray
        
        return values
    }
    
    init(values: [String:Any]) {
        self.address = values["address"] as! String
        self.postingUser = values["postingUser"] as! String
        self.description = values["description"] as! String
        self.keyword = values["keyword"] as? String
        self.toolsNeeded = values["toolsNeeded"] as? String
        self.hour = values["hour"] as? String
        self.category = values["category"] as? String
        self.price = values["price"] as? String
        let coordinateArray = values["coordinate"] as! [Double]
        self.coordinate = CLLocationCoordinate2D(latitude: coordinateArray[0], longitude: coordinateArray[1])
    }
    
    init(postingUser: String, address: String, description: String, coordinate: CLLocationCoordinate2D, keyword: String? = nil, toolsNeeded: String? = nil, hour: String? = nil, category: String? = nil, price: String? = nil) {
        self.address = address
        self.postingUser = postingUser
        self.description = description
        self.keyword = keyword
        self.toolsNeeded = toolsNeeded
        self.hour = hour
        self.category = category
        self.price = price
        self.coordinate = coordinate
    }
    
}

