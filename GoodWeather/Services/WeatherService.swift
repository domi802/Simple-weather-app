//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Dominik Woźniak on 10/03/2022.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?)->()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=ce47a63a3b5f983abce3d9a61e82860a") else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse =  weatherResponse{
                let weather = weatherResponse.main
                completion(weather)
        }else {
            completion(nil)
        }
        }.resume()
    
    }

}
