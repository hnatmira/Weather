//
//  WeatherManager.swift
//  Weather
//
//  Created by Miroslav Hnat  on 24.12.2020.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: Error)
    }



struct WeatherManager {
//   url for weather via cityName(Prague): https://api.openweathermap.org/data/2.5/weather?appid=b498a96ceb6b4f28a30c9e457cc9495a&units=metric&q=Prague
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b498a96ceb6b4f28a30c9e457cc9495a&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            // 2. Create a URL Session
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            //let task = session.dataTask(with: url, completionHandler: handle(data: urlResponse: error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(cityName: name, temperature: temp, conditionId: id)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
