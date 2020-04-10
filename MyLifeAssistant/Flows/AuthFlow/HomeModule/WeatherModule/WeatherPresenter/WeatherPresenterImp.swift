//
//  WeatherPresenterImp.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherPresenterImp: WeatherPresenter {
    
    weak var view: WeatherView?
    
    var state: WeatherPresenterState
    
    var weatherGateway = WeatherGateway()
    let locationManager = CLLocationManager()
    
    init(view: WeatherView, state: WeatherPresenterState) {
        self.view = view
        self.state = state
    }
    
    
    func didTrigerViewReadyEvent() {
        setupInitialState()
        
    }
    
    func setupInitialState() {
        
    }
    
    func requestUserLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    //MARK: - Update Weather
    func updateWeatherLocation(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) {
        weatherGateway.fetchWeather(latitude: latitude, longtitude: longtitude)
        
    }
    
    func updateWeather(_ city: String) {
        weatherGateway.fetchWeather(cityName: city)
    }
    
}

