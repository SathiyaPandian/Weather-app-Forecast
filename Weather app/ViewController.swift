//
//  ViewController.swift
//  Weather app
//
//  Created by SathiyaSuresh Pandian on 10/26/16.
//  Copyright © 2016 Sathiyasuresh Pandian. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController,  UISearchBarDelegate,UITableViewDelegate, UITableViewDataSource {
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather" // Weather app base url
    private let openWeatherMapAPIKey = "376eb8795ff2a33b951deaa6364eaa72" // Weather app developer key
    
    let defaults = UserDefaults.standard
    @IBOutlet weak var tableView: UITableView!
   
    var searchActive : Bool = false
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*  Set the Delegates */
        searchController.dimsBackgroundDuringPresentation = false //will dim the view it is presented over
        definesPresentationContext = true // search bar does not remain on the screen if the user navigates to another view controller
        tableView.tableHeaderView = searchController.searchBar //add the searchBar to your table view’s tableHeaderView
        searchController.searchBar.delegate = self
        tableView.delegate = self
        
        /* If there is a value in Userdefaults it will loaded on the app launch and it will fetch the weather forecast. */
        if let name = defaults.string(forKey:"locationKey") {
            // Method to get the weather forecast
            getWeather(city:name)
            searchController.searchBar.text = name // Value will be prepopulated
        }
    }
  
    func getWeather(city: String) {
        
        // configuring URL session, so the shared session will do.
        let session = URLSession(configuration: URLSessionConfiguration.default)
      //  Constructing URL with Key and Query
        let weatherRequestURL = NSURL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")! // KNOWN ISSUE: String contains space between words is not handled, example: New York, New Orleans, it will work it is given as Newyork.
        
        // The data task which retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL as URL!) {
            (data, response, error) -> Void in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                print("Data:\n\(data!)")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("Human-readable data:\n\(dataString!)")// just  printing to make sure the value is received.
                // Due to time constraint the Object mapping for JSON results are not done.
                
            }
        }
        
        // The data task is set up...launch it!
        dataTask.resume()
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //json object count, it is not handled.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
         let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        // KNOWN ISSUE: Due to time constraint couldn't set up the table view cell to load the weather forecast.
        
        return cell
    }

// Mark: Search Delegate
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // dismiss the keyboard 
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
         if let searchText = searchBar.text {
             getWeather(city: searchText)
            defaults.set(searchText, forKey: "locationKey") // Setting the value in user defaults to load on next launch
         }
        
        
    }
    
}



