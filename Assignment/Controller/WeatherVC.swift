//
//  WeatherVC.swift
//  Assignment_iOS
//
//  Created by Cooldown on 4/10/18.
//  Copyright © 2018 Cooldown. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherVC: UIViewController, CLLocationManagerDelegate, changeCityDelegate {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    // Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "e143f386ee9382add79222f7855a46ef"
    
    let weatherModel = WeatherModel()
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // Networking Weather Data
    func getWeatherData(url: String, weather: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters: weather).responseJSON {
            response in
            if response.result.isSuccess {
                
                let weatherJSON: JSON = JSON(response.result.value!)
                print(weatherJSON)
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                print("Error \(response.result.error)")
                self.cityLabel.text = "Check your internet connection"
            }
        }
    }
    
    // Update weather data
    func updateWeatherData(json: JSON) {
        
        if let temperature = json["main"]["temp"].double {
        
            weatherModel.temperature = Int(temperature - 273.15)
        
            weatherModel.city = json["name"].stringValue
        
            weatherModel.condition = json["weather"][0]["id"].intValue
        
            weatherModel.weatherIconName = weatherModel.updateWeatherIcon(condition: weatherModel.condition)
            
            updateUI()
        }
        else {
            cityLabel.text = "Unavailable to get weather"
        }
        
    }
    
    func updateUI() {
        cityLabel.text = weatherModel.city
        temperatureLabel.text = "\(weatherModel.temperature)°"
        weatherIcon.image = UIImage(named: weatherModel.weatherIconName)
    }
    
    
    
    
    
    // Update Location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let weather: [String: String] = ["lat": latitude, "lon": longitude, "appid": APP_ID]
            
            getWeatherData(url: WEATHER_URL, weather: weather)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Unable to determine your location"
    }
    
    func newCity(city: String) {
        let weatherCity: [String: String] = ["q": city, "appid": APP_ID]
        
        getWeatherData(url: WEATHER_URL, weather: weatherCity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCitySegue" {
            let vc = segue.destination as! WeatherCityVC
            vc.delegate = self
        }
    }
    
    
}
