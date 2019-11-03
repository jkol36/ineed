//
//  HOME.swift
//  iNeed
//
//  Created by Dezmond Payne on 5/31/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseAuth




class HOME: UIViewController {
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var MapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionmeters: Double = 1000
    
    @IBOutlet weak var LeadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapView.delegate = self
        loadJobPostings()
        
 checklocationservices()
    
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
            
   
                self.navigationItem.title = dictionary["name"] as? String
            self.navigationItem.title = dictionary["name"] as? String
            }
            
            
        }, withCancel: nil)
        
        
    }
    
    @IBAction func OpenMenu(_ sender: Any) {
        
        if (menuShowing) {
            LeadingConstraint.constant = -234
        } else {
          LeadingConstraint.constant = 0
        }
        
        menuShowing = !menuShowing
        
    }
    
    
    func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
   
    
    }
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
            MapView.setRegion(region, animated: true)
        }
        
    }
    
    func checklocationservices() {
        if CLLocationManager.locationServicesEnabled() {
    setupLocationManager()
            checkLocationAuthorization()
        } else {
            
        }
        
    
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            MapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        
        }
    }
    
    func loadJobPostings() {
        let  ref = Database.database().reference(fromURL: "https://ineed-97442.firebaseio.com/")
        let postingReference = ref.child("jobPostings")
        postingReference.observe(.childAdded) { (snapshot) in
            let values = snapshot.value as! [String:Any]
            let posting = JobPosting(values: values)
            let coordinate = posting.coordinate
            if self.locationIsInRegion(coordinate) {
                let annotation = PostingAnnotation(posting: posting)
                self.MapView.addAnnotation(annotation)
            }
        }
    }
    
    fileprivate func locationIsInRegion(_ locationCoordinates: CLLocationCoordinate2D) -> Bool {
        let region = MapView.region
        let center = region.center
        var northWestCorner = CLLocationCoordinate2D()
        var southEastCorner = CLLocationCoordinate2D()
        
        northWestCorner.latitude  = center.latitude  - (region.span.latitudeDelta  / 2.0)
        northWestCorner.longitude = center.longitude - (region.span.longitudeDelta / 2.0)
        southEastCorner.latitude  = center.latitude  + (region.span.latitudeDelta  / 2.0)
        southEastCorner.longitude = center.longitude + (region.span.longitudeDelta / 2.0)
        
        if locationCoordinates.latitude >= northWestCorner.latitude &&
            locationCoordinates.latitude <= southEastCorner.latitude &&
            locationCoordinates.longitude >= northWestCorner.longitude &&
            locationCoordinates.longitude <= southEastCorner.longitude {
            return true
        }
        else {
            return false
        }
    }
}
        
        
        
extension HOME: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionmeters, longitudinalMeters: regionmeters)
        MapView.setRegion(region, animated: true)

    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
checkLocationAuthorization()
        
    }
    
}

extension HOME: MKMapViewDelegate {
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? PostingAnnotation {
            let detailsController = DetailsController()
            detailsController.posting = annotation.posting
            navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}

