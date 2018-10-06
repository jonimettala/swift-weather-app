//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Joni Mettälä on 06/10/2018.
//  Copyright © 2018 Joni Mettälä. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    let requester = WeatherRequester()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        requester.fetchCityWeather(city: "Helsinki")
        
    }
    
    
}
