//
//  WeatherData.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 04.11.2019.
//  Copyright © 2019 Антон Захарченко. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
