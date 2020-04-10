//
//  WeatherView.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

protocol WeatherView: BaseView {
    func showWeather(city: String, temperature: String, image: String)
}
