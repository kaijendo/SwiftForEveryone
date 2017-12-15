//
//  Weather.swift
//  WeatherApp
//
//  Created by Thuy Truong Quang on 12/11/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.

import Foundation
typealias JSON = Dictionary<AnyHashable, Any>

struct Location {
    var name: String?
    var country: String?
    var region: String?
    var lat: Double?
    var lon: Double?
    var tz_id: String?
    var localtime: String?
    
    init?(dict: JSON) {
        guard let location = dict["location"] as? JSON else {
            return nil
        }
        self.name = location["name"] as? String
        self.country =  location["country"] as? String
        self.region = location["region"] as? String
        self.lat = location["lat"] as? Double
        self.lon = location["lon"] as? Double
        self.tz_id = location["tz_id"] as? String
        self.localtime = location["localtime"] as? String
    }
}

class Condition {
    var text: String?
    var icon: String?
    init?(dict: JSON) {
        guard let condition = dict["condition"] as? JSON else {
            return
        }
        self.text = condition["text"] as? String
        self.icon = condition["icon"] as? String
    }
}

class Current {
    var temp_c: Double?
    var temp_f: Double?
    var last_updated: String?
    var wind_mph: Double?
    var wind_kph: Double?
    var wind_degree: Int?
    var cloud: Int?
    var feelslike_c: Double?
    var feelslike_f: Double?
    var condition: Condition?
    init?(dict: JSON) {
        guard let current = dict["current"] as? JSON else {
            return
        }
        guard let condition = Condition(dict: current) else {
            return
        }
        self.temp_c = current["temp_c"] as? Double
        self.temp_f = current["temp_f"] as? Double
        self.last_updated = current["last_updated"] as? String
        self.wind_mph = current["wind_mph"] as? Double
        self.wind_kph = current["wind_mph"] as? Double
        self.wind_degree = current["wind_degree"] as? Int
        self.cloud = current["cloud"] as? Int
        self.feelslike_c = current["feelslike_c"] as? Double
        self.feelslike_f = current["feelslike_f"] as? Double
        self.condition = condition
        
    }
}
class Forecastday {
    var date: String?
    var day: [Day] = []
    var astro: [Astro] = []
    var hours: [Hour] = []
    
    init(dict: JSON) {
        
        guard let astroObject = dict["astro"] as? JSON else {
            return
        }
        if let astro = Astro(dict: astroObject) {
            self.astro.append(astro)
        }
        guard let dayObject = dict["day"] as? JSON else {
            return
        }
            if let day = Day(dict: dayObject) {
                self.day.append(day)
        }
        guard let hoursObject = dict["hour"] as? [JSON] else {
            return
        }
        for item in hoursObject {
            if let hour = Hour(dict: item) {
                self.hours.append(hour)
            }
        }
        self.date = dict["date"] as? String
    }
}


class Astro {
    var sunrise: String?
    var sunset: String?
    var moonrise: String?
    var moonset: String?
    
    init?(dict: JSON) {
        self.sunrise = dict["sunrise"] as? String
        self.sunset = dict["sunset"] as? String
        self.moonrise = dict["moonrise"] as? String
        self.moonset = dict["moonset"] as? String
    }
    
}

class Day {
    var maxtemp_c: Double?
    var maxtemp_f: Double?
    var mintemp_c: Double?
    var mintemp_f: Double?
    var avgtemp_c: Double?
    var avgtemp_f: Double?
    var condition: Condition?
    
    init?(dict: JSON) {
        guard let condition = Condition(dict: dict) else {
            return
        }
        self.maxtemp_c = dict["maxtemp_c"] as? Double
        self.maxtemp_f = dict["maxtemp_f"] as? Double
        self.mintemp_c = dict["mintemp_c"] as? Double
        self.mintemp_f = dict["mintemp_f"] as? Double
        self.avgtemp_c = dict["avgtemp_c"] as? Double
        self.avgtemp_f = dict["avgtemp_f"] as? Double
        self.condition = condition
    }
}

class Hour {
    var time: String?
    var temp_c: Double?
    var temp_f: Double?
    var is_day: Int?
    
    init?(dict: JSON) {
        self.time = dict["time"] as? String
        self.temp_c = dict["temp_c"] as? Double
        self.temp_f = dict["temp_f"] as? Double
        self.is_day = dict["is_day"] as? Int
    }
}

class Weather {
    var location: Location?
    var current: Current?
    var forecasts = [Forecastday]()

    init(dict: JSON) {
        self.current = Current(dict: dict)
        self.location = Location(dict: dict)
        guard let forecast = dict["forecast"] as? JSON,
            let forecastdays = forecast["forecastday"] as? [JSON] else {
                return
        }
        for item in forecastdays {
            self.forecasts.append(Forecastday(dict: item))
            print(self.forecasts.count)
        }
    }
}



