//
//  WeatherPresenter.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherPresenter: class {
    func didTrigerViewReadyEvent()
    func updateWeatherLocation(latitude: CLLocationDegrees, longtitude: CLLocationDegrees)
    func updateWeather(_ city: String)
}

