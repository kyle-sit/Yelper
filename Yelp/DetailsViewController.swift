//
//  DetailsViewController.swift
//  Yelp
//
//  Created by Kyle Sit on 2/20/17.
//  Copyright © 2017 Kyle Sit. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    //instance variables
    var business: Business!
    
    // UI outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var lineLabel1: UILabel!
    @IBOutlet weak var lineLabel2: UILabel!
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI specifications for navigation bar red
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor(red: 0.9176, green: 0, blue: 0, alpha: 1.0)
        }

        //rotate the lines separating the buttons
        lineLabel1.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        lineLabel2.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
        //Populating the labels and images with appropriate content
        businessNameLabel.text = business.name
        if business.imageURL != nil {
            backgroundImage.setImageWith(business.imageURL!)
        }
        typeLabel.text = business.categories
        addressLabel.text = business.address
        reviewsLabel.text = "\(business.reviewCount!) Reviews"
        ratingImageView.setImageWith(business.ratingImageURL!)
        distanceLabel.text = business.distance
        
        //setting map components
        // set initial location in SF
        //let initialLocation = CLLocation(latitude: 37.785771, longitude: -122.406165)
        let initialLocation = CLLocation(latitude: business.latitude!, longitude: business.longitude!)
        centerMapOnLocation(location: initialLocation)
        
        //show business on map
        let point = MapPoint(title: business.name!,
                              locationName: business.city!,
                              category: business.categories!,
                              coordinate: CLLocationCoordinate2D(latitude: business.latitude!, longitude: business.longitude!))
        
        mapView.addAnnotation(point)
        
    }

    
    //memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
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
