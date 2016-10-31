//
//  JsonSerialization.swift
//  Weather app
//
//  Created by SathiyaSuresh Pandian on 10/27/16.
//  Copyright © 2016 Sathiyasuresh Pandian. All rights reserved.
//

import Foundation
extension Weather {
    init?(json: [String: Any]) { // Creating an initializer that takes an Any argument that extracts and transforms data from the JSON representation into properties
        guard
            let coordinatesJSON = json["coord"] as? [String: String],
            let longitude = coordinatesJSON["lon"],
            let latitude = coordinatesJSON["lat"],
            let weatherJSON = json["weather"] as? [String],
            let baseValue = json["base"] as? [String],
            let mainJson = json["main"] as? [String: String],
            let tempJson = mainJson["temp"],
            let pressureJson = mainJson["pressure"],
            let humidityJson = mainJson["humidity"],
            let temp_minJson = mainJson["temp_min"],
            let temp_maxJson = mainJson["temp_max"],
            let sea_levelJson = mainJson["sea_level"],
            let grnd_levelJson = mainJson["grnd_level"],
            let windJson = json["wind"] as? [String: String],
            let speed = windJson["speed"],
            let deg = windJson["deg"],
            let cloudsJson = json["clouds"] as? [String: String],
            let allJson = cloudsJson["all"],
            let dtJson = json["dt"] as? [String],
            let sysJson = json["sys"] as? [String: String],
            let messageJson = sysJson["message"],
            let countryJson = sysJson["country"],
            let sunriseJson = sysJson["sunrise"],
            let sunsetJson = sysJson["sunset"],
            let idJson = json["id"] as? [String],
            let nameJson = json["name"] as? [String],
            let codJson = json["cod"] as? [String]
            else {
                return nil
        }

    /*    self.coord = (longitude, latitude)
        self.weather = Weather
        self.base = base
        self.main = (temp, pressure, humidity, temp_min, temp_max, sea_level, grnd_level)
        self.wind = (speed, deg)
        self.clouds = (all)
        self.dt = dt
        self.sys = (message, country, sunrise, sunset)
        self.id = id
        self.name = name
        self.cod = cod*/
    }
}
