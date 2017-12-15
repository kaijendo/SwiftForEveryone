//
//  DataServices.swift
//  WeatherApp
//
//  Created by Thuy Truong Quang on 12/11/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import Foundation

class DataServices {
    static let shared = DataServices()
    var searchKey: String = "" {
        didSet {
            parameterWith(locationString: searchKey, days: 8, lang: "VI")
        }
    }
    var weather: Weather!
}

// MARK: - Private Function
extension DataServices {
    func makeDataTaskRequest(request: URLRequest, completedBlock: @escaping (JSON) -> Void ) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let jsonObject =  try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) else {
                return
            }
            guard let json = jsonObject as? JSON else {
                return
            }
            DispatchQueue.main.async {
                completedBlock(json)
            }
        }
        task.resume()
    }
    
    func parameterWith(locationString: String?, days: Int?, lang: String?) {
        var dictionaryParameter: Dictionary<String, Any> = [:]
        let urlBase = BaseRequest().URL
        var urlString = urlBase
        dictionaryParameter["q"] = locationString
        dictionaryParameter["days"] = days
        dictionaryParameter["lang"] = lang
        
        for (key, value) in dictionaryParameter {
            urlString += "&" + key + "=" + "\(value)"
        }
        guard let url = URL(string: urlString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        print(urlString)
        self.makeDataTaskRequest(request: urlRequest) { (JSON) in
            self.weather = Weather(dict: JSON)
            NotificationCenter.default.post(name: Notification.Name.GetData().didGetData, object: nil)
        }
    }
}
