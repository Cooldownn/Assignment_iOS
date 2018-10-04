//
//  WeatherModel.swift
//  Assignment_iOS
//
//  Created by Cooldown on 4/10/18.
//  Copyright © 2018 Cooldown. All rights reserved.
//

import UIKit

class WeatherModel {
    
    var temperature: Int = 0
    var condition: Int = 0
    var city: String = ""
    var weatherIconName: String = ""
    
    func updateWeatherIcon(condition: Int) -> String {
    
        switch (condition) {
    
            case 0...300 :
                return "case1"
    
            case 301...500 :
                return "case2"
    
            case 501...600 :
                return "case3"
    
            case 601...700 :
                return "case4"
    
            case 701...771 :
                return "case5"
    
            case 772...799 :
                return "case6"
    
            case 800 :
                return "case7"
    
            case 801...804 :
                return "case8"
    
            case 900...903, 905...1000  :
                return "case6"
    
            case 903 :
                return "case9"
    
            case 904 :
                return "case7"
    
            default :
                return "none"
            }
    
        }
}

