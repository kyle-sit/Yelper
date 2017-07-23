//
//  MapViewController.swift
//  Yelp
//
//  Created by Kyle Sit on 7/18/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    //outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //instance variables
    var businesses: [Business]!
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //UI specifications for navigation bar red
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor(red: 0.9176, green: 0, blue: 0, alpha: 1.0)
        }
        
        let initial = businesses[0];
        
        let initialLocation = CLLocation(latitude: initial.latitude!, longitude: initial.longitude!)
        centerMapOnLocation(location: initialLocation)
        
        
        //load the mapview with the business points
        for business in businesses {
            //show business on map
            let point = MapPoint(title: business.name!,
                                 locationName: business.city!,
                                 category: business.categories!,
                                 coordinate: CLLocationCoordinate2D(latitude: business.latitude!, longitude: business.longitude!))
            
            mapView.addAnnotation(point)
        }

    }

    
    //cancel the view
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //helper method
    let regionRadius: CLLocationDistance = 500
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    //memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
