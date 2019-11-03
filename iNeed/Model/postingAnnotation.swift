//
//  postingAnnotation.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/5/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//


import Foundation
import MapKit

class PostingAnnotation: NSObject, MKAnnotation {
    
    dynamic var coordinate: CLLocationCoordinate2D
    var posting: JobPosting
    
    init(posting: JobPosting) {
        self.coordinate = posting.coordinate
        self.posting = posting
        super.init()
    }
    
}
