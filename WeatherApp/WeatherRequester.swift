//
//  WeatherRequester.swift
//  WeatherApp
//
//  Created by Joni Mettälä on 06/10/2018.
//  Copyright © 2018 Joni Mettälä. All rights reserved.
//

import Foundation

class WeatherRequester {
    let apiKey = "d8a08148d1f7499be6b7a90a9ef8fac5"
    let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    let testUrl = "https://api.openweathermap.org/data/2.5/weather?q=Tampere&appid=d8a08148d1f7499be6b7a90a9ef8fac5"
    
    func fetchUrl(url: String) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url: URL? = URL(string: url)
        let task = session.dataTask(with: url!, completionHandler: doneFetching)
        task.resume()
    }
    
    func doneFetching(data: Data?, response: URLResponse?, error: Error?) {
        let resstr = String(data: data!, encoding: String.Encoding.utf8)
        NSLog(resstr!)
        
        do {
            let weather = try JSONDecoder().decode(CurrentWeather.self, from: data!)
            NSLog(String(weather.main.temp))
        } catch {
            NSLog("error")
        }
        
        DispatchQueue.main.async(execute: {() in
            // reload data in view
        })
    }
    
    func fetchCityWeather(city: String) {
        
        let url = baseUrl + "?q=" + city + appId()
        fetchUrl(url: url)
    }
    
    func appId() -> String {
        return "&appid=" + self.apiKey
    }
}
