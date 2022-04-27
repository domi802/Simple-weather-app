//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Dominik Woźniak on 10/03/2022.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService!
    
   @Published var weather = Weather()
    
    
    init(){
        self.weatherService = WeatherService()
    }
    
    
    var temperature: String{
        if let temp = self.weather.temp{
            return String(format: "%.1f", temp)
        }else{
            return""
        }
    }
    
    var humidity: String{
        if let humidity = self.weather.humidity{
            return String(format: "%.0f", humidity)
        }else{
            return""
        }
    }
    
    var cityName: String=""
    
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(by: city)
        }
        
    }
    
    private func fetchWeather(by city: String){
        self.weatherService.getWeather(city: city){weather in
        
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
                
            }
        }
    }
    
}
