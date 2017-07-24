//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Kyle Sit on 7/18/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //outlets
    @IBOutlet weak var filtersTableView1: UITableView!
    @IBOutlet weak var filtersTableView2: UITableView!
    
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

        //TableViews setup
        filtersTableView1.delegate = self
        filtersTableView1.dataSource = self
        filtersTableView2.delegate = self
        filtersTableView2.dataSource = self
        
        //UI specifications for navigation bar red
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor(red: 0.9176, green: 0, blue: 0, alpha: 1.0)
        }
        
        //setting all search vars to false
        orderDelivery = false
        orderPickup = false
        makeReservation = false
        offeringDeal = false
        hotAndNew = false
        openNow = false
    }

    
    //function to determine rows count
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


    //function to populate cells
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell?
        
        //First Filters TableView
        if tableView == self.filtersTableView1{
            let cell1 = filtersTableView1.dequeueReusableCell(withIdentifier: "FilterCell1", for: indexPath) as! FilterCell
            
            //turn switch off
            cell1.switch1.isOn = false
           
            //individually name each option
            if indexPath.row == 1 {
                cell1.label1.text = "Order Delivery"
            }
            else if indexPath.row == 2 {
                cell1.label1.text = "Order Pickup"
            }
            else {
                cell1.label1.text = "Make a Reservation"
            }
            cell = cell1
        }
        
        //Second Filters TableView
        if tableView == self.filtersTableView2 {
            let cell2 = filtersTableView2.dequeueReusableCell(withIdentifier: "FilterCell2", for: indexPath) as! FilterCell
            
            //turn switch off
            cell2.switch2.isOn = false
            
            //individually name each option
            if indexPath.row == 1 {
                cell2.label2.text = "Offering a Deal"
            }
            else if indexPath.row == 2 {
                cell2.label2.text = "Hot and New"
            }
            else {
                cell2.label2.text = "Open Now"
            }
            cell = cell2
        }
        
        return cell!
    }
    
    
    //turn on options for first 3 switches
    @IBAction func OnSwitch1(_ sender: Any) {
        let cell1 = filtersTableView2.dequeueReusableCell(withIdentifier: "FilterCell1") as! FilterCell
        
        //individually name each option
        if cell1.label1.text == "Order Delivery" {
            if cell1.switch1.isOn == true {
                orderDelivery = true
            }
        }
        else if cell1.label1.text == "Order Pickup" {
            if cell1.switch1.isOn == true {
                orderPickup = true
            }
        }
        else if cell1.label1.text == "Make a Reservation" {
            if cell1.switch1.isOn == true {
                makeReservation = true
            }
        }
    }
    
    
    //turn on options for second 3 swtiches
    @IBAction func OnSwitch2(_ sender: Any) {
        let cell2 = filtersTableView2.dequeueReusableCell(withIdentifier: "FilterCell2") as! FilterCell
        
        //individually name each option
        if cell2.label2.text == "Offering a Deal" {
            if cell2.switch2.isOn == true {
                offeringDeal = true
            }
        }
        else if cell2.label2.text == "Hot and New" {
            if cell2.switch2.isOn == true {
                hotAndNew = true
            }
        }
        else if cell2.label2.text == "Open Now" {
            if cell2.switch2.isOn == true {
                openNow = true
            }
        }
    }
    
    
    //cancel the view
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //make the search
    @IBAction func confirmSearch(_ sender: Any) {
        let root = self.presentingViewController as! BusinessesViewController
        root.orderDelivery = orderDelivery
        root.orderPickup = orderPickup
        root.makeReservation = makeReservation
        root.offeringDeal = offeringDeal
        root.hotAndNew = hotAndNew
        root.openNow = openNow
        print(orderPickup)
        self.dismiss(animated: true, completion: nil)
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

