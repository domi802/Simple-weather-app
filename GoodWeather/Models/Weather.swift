//
//  Weather.swift
//  GoodWeather
//
//  Created by Dominik Woźniak on 10/03/2022.
//

import Foundation

struct WeatherResponse: Decodable{
    let main: Weather
}


struct Weather : Decodable{
    var temp: Double?
    var humidity: Double?
}
