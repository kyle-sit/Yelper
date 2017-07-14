//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Kyle Sit on 1/1/17.
//  Copyright (c) 2016 Kyle Sit. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIScrollViewDelegate {
    
    //table outlet
    @IBOutlet weak var businessTableView: UITableView!
    
    //instance variables
    var businesses: [Business]!
    var filteredBusinesses: [Business]!
    let searchBar = UISearchBar()
    var isMoreDataLoading = false
    var loadingMoreView:InfiniteScrollActivityView?
    var countedOffset = 20
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView setup
        businessTableView.delegate = self
        businessTableView.dataSource = self
        businessTableView.rowHeight = UITableViewAutomaticDimension
        businessTableView.estimatedRowHeight = 120
        
        //SearchBar Setup
        filteredBusinesses = businesses
        searchBar.delegate = self
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        //UI specifications for navigation bar red
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor(red: 0.9176, green: 0, blue: 0, alpha: 1.0)
        }
        
        // Set up Infinite Scroll loading indicator
        let frame = CGRect(x: 0, y: businessTableView.contentSize.height, width: businessTableView.bounds.size.width, height: InfiniteScrollActivityView.defaultHeight)
        loadingMoreView = InfiniteScrollActivityView(frame: frame)
        loadingMoreView!.isHidden = true
        businessTableView.addSubview(loadingMoreView!)
        
        var insets = businessTableView.contentInset
        insets.bottom += InfiniteScrollActivityView.defaultHeight
        businessTableView.contentInset = insets
        
        //First load of the tableview
        Business.searchWithTerm(term: "", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.filteredBusinesses = businesses
            self.businessTableView.reloadData()

            }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         }
         */
    }
    
    
    //function to obtain number of rows based off of number of businesses
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredBusinesses != nil {
            return filteredBusinesses!.count
        }
        else {
            return 0
        }
    }
    
    
    //function to populate cells in the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessTableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = filteredBusinesses![indexPath.row]
        
        return cell
    }
    
    
    //function for deselecting cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        businessTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //function to implement a searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        countedOffset = 0
        
        Business.searchWithTerm(term: searchText, completion: { (bs: [Business]?, error: Error?) -> Void in
            self.filteredBusinesses = bs
            
            self.businessTableView.reloadData()
        })
        
    }
    
    
    //function to begin searching
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    
    //function for canceling a search
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
    }
    
    
    //function called for infinite scroll to load more businesses
    func loadMoreData() {
        
        /*Business.searchWithTerm(term: "", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            // Update flag
            self.isMoreDataLoading = false
            
            // Stop the loading indicator
            self.loadingMoreView!.stopAnimating()
            
            // ... Use the new data to update the data source ...
            self.filteredBusinesses.append(contentsOf: businesses!)
            
            // Reload the tableView now that there is new data
            self.businessTableView.reloadData()
        })*/
        
        Business.searchWithTerm(term: "", sort: nil, categories: nil, deals: nil, offset: countedOffset) { (businesses: [Business]?, error: Error?) -> Void in
            
            // Update flag
            self.isMoreDataLoading = false
            
            //Update Offset
            self.countedOffset += 20
            
            // Stop the loading indicator
            self.loadingMoreView!.stopAnimating()
            
            // ... Use the new data to update the data source ...
            self.filteredBusinesses.append(contentsOf: businesses!)
            
            // Reload the tableView now that there is new data
            self.businessTableView.reloadData()
            
        }

        
    }
    
    
    //function for infinite scrolling using the loadMoreData
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (!isMoreDataLoading) {
            
            // Calculate the position of one screen length before the bottom of the results
            let scrollViewContentHeight = businessTableView.contentSize.height
            let scrollOffsetThreshold = scrollViewContentHeight - businessTableView.bounds.size.height
            
            // When the user has scrolled past the threshold, start requesting
            if(scrollView.contentOffset.y > scrollOffsetThreshold && businessTableView.isDragging) {
                
                isMoreDataLoading = true
                
                // Update position of loadingMoreView, and start loading indicator
                let frame = CGRect(x: 0, y: businessTableView.contentSize.height, width: businessTableView.bounds.size.width, height: InfiniteScrollActivityView.defaultHeight)
                loadingMoreView?.frame = frame
                loadingMoreView!.startAnimating()
                
                // Code to load more results
                loadMoreData()
            }
        }
    }
    
    
    //memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
