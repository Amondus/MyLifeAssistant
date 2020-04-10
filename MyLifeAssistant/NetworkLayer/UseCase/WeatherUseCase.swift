//
//  WeatherUseCase.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol WeatherUseCase {
    func didUpdateWeather(_ weatherGateway: WeatherGateway, weather: WeatherModel)
    func didFailWithError(error: Error)
}
