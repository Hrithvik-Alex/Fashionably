//
//  ViewController.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-12.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import RealmSwift

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    
    
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    
    
    
    // Getting Weather Data from API
    func getWeatherData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                
                print("Success! Got the weather data")
                let weatherJSON : JSON = JSON(response.result.value!)
                print(weatherJSON)
                
                self.updateWeatherData(json: weatherJSON);
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
        
    }
    
    func updateWeatherData(json : JSON){
        let tempResult = json["main"]["temp"].doubleValue
        
        weatherDataModel.temperature = Int(tempResult - 273.15)
       weatherLabel.text = "\(weatherDataModel.temperature)"
        
    }
    
    
    // CLLocationManager Delegate methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            
            self.locationManager.stopUpdatingLocation()
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}























