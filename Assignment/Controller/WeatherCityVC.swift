//
//  WeatherCityVC.swift
//  Assignment_iOS
//
//  Created by Cooldown on 4/10/18.
//  Copyright © 2018 Cooldown. All rights reserved.
//

import UIKit

protocol changeCityDelegate {
    func newCity(city: String)
}

class WeatherCityVC: UIViewController {
    
    var delegate: changeCityDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        let cityName = textField.text!
        delegate?.newCity(city: cityName)
        self.dismiss(animated: true, completion: nil)
    
    }
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
