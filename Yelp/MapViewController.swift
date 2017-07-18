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

    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //UI specifications for navigation bar red
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor(red: 0.9176, green: 0, blue: 0, alpha: 1.0)
        }
    }

    
    //cancel the view
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
