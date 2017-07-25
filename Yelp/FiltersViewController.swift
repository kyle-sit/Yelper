//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Kyle Sit on 7/18/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {

    //outlets
    @IBOutlet weak var orderDeliverySwitch: UISwitch!
    @IBOutlet weak var orderPickupSwitch: UISwitch!
    @IBOutlet weak var makeReservationSwitch: UISwitch!
    @IBOutlet weak var hotAndNewSwitch: UISwitch!
    @IBOutlet weak var openNowSwitch: UISwitch!
    @IBOutlet weak var offeringDealsSwitch: UISwitch!
    
    //category variables for searching
    var orderDelivery = false
    var orderPickup = false
    var makeReservation = false
    var offeringDeal = false
    var hotAndNew = false
    var openNow = false
    
    //delegate for passing info to source VC
    //var delegate:FiltersViewControllerDelegate!
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI specifications for navigation bar red
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor(red: 0.9176, green: 0, blue: 0, alpha: 1.0)
        }
        
        //setting all switches off
        orderDeliverySwitch.isOn = false
        orderPickupSwitch.isOn = false
        makeReservationSwitch.isOn = false
        hotAndNewSwitch.isOn = false
        openNowSwitch.isOn = false
        offeringDealsSwitch.isOn = false
        
        //setting all search vars to false
        orderDelivery = false
        orderPickup = false
        makeReservation = false
        offeringDeal = false
        hotAndNew = false
        openNow = false
    }
    
    
    //cancel the view
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //make the search
    @IBAction func confirmSearch(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        let parent = self.presentingViewController as! UINavigationController
        let root = parent.topViewController as! BusinessesViewController
        root.orderDelivery = orderDelivery
        root.orderPickup = orderPickup
        root.makeReservation = makeReservation
        root.offeringDeal = offeringDeal
        root.hotAndNew = hotAndNew
        root.openNow = openNow
        print(orderDelivery)
        print(orderPickup)
        //self.dismiss(animated: true, completion: nil)
    }
    
    
    //onSwitch for delivery
    @IBAction func OnSwitchOrDel(_ sender: Any) {
        if orderDeliverySwitch.isOn == true {
            orderDelivery = true
        }
    }
    
    
    //onSwitch for pickup
    @IBAction func OnSwitchOrPic(_ sender: Any) {
        if orderPickupSwitch.isOn == true {
            orderPickup = true
        }
    }
    
    
    //onSwitch for reservation
    @IBAction func OnSwitchMkRes(_ sender: Any) {
        if makeReservationSwitch.isOn == true {
            makeReservation = true
        }
    }
    
    
    //onSwitch for deals
    @IBAction func OnSwitchOfDeal(_ sender: Any) {
        if offeringDealsSwitch.isOn == true {
            offeringDeal = true
        }
    }
    
    
    //onSwitch for hot and new
    @IBAction func OnSwitchHAN(_ sender: Any) {
        if hotAndNewSwitch.isOn == true {
            hotAndNew = true
        }
    }
    
    
    //onSwitch for open now
    @IBAction func OnSwitchON(_ sender: Any) {
        if openNowSwitch.isOn == true {
            openNow = true
        }
    }
    
    
    //Memory Warning
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

/*protocol FiltersViewControllerDelegate
{
    func sendValue(value : NSString)
}*/

