//
//  PhotoOfTheDayController.swift
//  Nasa Photo of The Day
//
//  Created by Eric Davis on 08/10/2021.
//

import UIKit

struct PhotoOfTheDayController {
    
    func fetchPhotoOfTheDay(completion: @escaping (PhotoOfTheDay?) -> Void) {
        
        guard var baseURL = URLComponents(string: "https://api.nasa.gov/planetary/apod") else {return}
        let queryItems = [URLQueryItem(name: "api_key", value: "DEMO_KEY")]
        baseURL.queryItems = queryItems
        
        let url = baseURL.url
        print(url!)
        

        
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let photOfTheDay = try decoder.decode(PhotoOfTheDay.self, from: data)
                    completion(photOfTheDay)
                } catch{
                    print(error)
                }
                                print(data)
            } else if let error = error {
                completion(nil)
            }
        }.resume()
    }
    
}


