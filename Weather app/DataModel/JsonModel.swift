//
//  JsonModel.swift
//  Weather app
//
//  Created by SathiyaSuresh Pandian on 10/27/16.
//  Copyright © 2016 Sathiyasuresh Pandian. All rights reserved.
//

import Foundation
// converting JSON data to objects that are specific to Weather app’s domain in a model definition
class Repository {
    
    var coord: NSDictionary?
    var lon: String?
    var lat: String?
    var weather: NSArray?
    var description: String?
    var icon: String?
    var base: String?
    var main: NSDictionary?
    var temp: String?
    var pressure: String?
    var humidity: String?
    var temp_min: String?
    var temp_max: String?
    var sea_level: String?
    var grnd_level: String?
    var wind: NSDictionary?
    var speed: String?
    var deg: String?
    var clouds: NSDictionary?
    var all: String?
    var dt: String?
    var sys: NSDictionary?
    var message: String?
    var country: String?
    var sunrise: String?
    var sunset: String?
    var id: String?
    var name: String?
    var cod: String?
    
    init(json: NSDictionary) {
        
        self.coord = json["coord"] as? NSDictionary
        self.lon = json["lon"] as? String
        self.lat = json["lat"] as? String
        self.weather = json[""] as? NSArray
        self.description = json["description"] as? String
        self.icon = json["icon"] as? String
        self.base = json["base"] as? String
        self.main  = json["main"] as? NSDictionary
        self.temp = json["main"] as? String
        self.pressure = json["main"] as? String
        self.humidity = json["main"] as? String
        self.temp_min = json["main"] as? String
        self.temp_max = json["main"] as? String
        self.sea_level = json["main"] as? String
        self.grnd_level = json["main"] as? String
        self.wind = json[""] as? NSDictionary
        self.speed = json["wind"] as? String
        self.deg = json["wind"] as? String
        self.clouds = json["clouds"] as? NSDictionary
        self.all = json["clouds"] as? String
        self.dt = json["dt"] as? String
        self.sys = json["sys"] as? NSDictionary
        self.message = json["sys"] as? String
        self.country = json["sys"] as? String
        self.sunrise = json["sys"] as? String
        self.sunset = json["sys"] as? String
        self.id = json["id"] as? String
        self.name = json["name"] as? String
        self.cod = json["cod"] as? String
        
    }
}
