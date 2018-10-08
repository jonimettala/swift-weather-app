//
//  CityTableViewController.swift
//  WeatherApp
//
//  Created by Joni Mettälä on 06/10/2018.
//  Copyright © 2018 Joni Mettälä. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    let data = ["Helsinki", "Oulu", "Tampere", "Turku"]
    
    var selectedCity = "Oulu"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "citycell")
        
        cell!.textLabel!.text = data[indexPath.row]
        return cell!
    }
}
