//
//  PhotoOfTheDay.swift
//  Nasa Photo of The Day
//
//  Created by Eric Davis on 08/10/2021.
//

import Foundation


struct PhotoOfTheDay: Codable {
    var title: String
    var copyright: String
    var date: String
    var explanation: String
    var url: URL
    
    enum CodingKeys: String, CodingKey {
        case title
        case copyright
        case date
        case explanation
        case url
    }
    
}


//MARK: - this is what we have to work with
//{
//  "copyright": "Jack Groves",

//  "date": "2021-10-08",

//  "explanation": "This pretty starfield spans about three full moons (1.5 degrees) across the heroic northern constellation of Perseus. It holds the famous pair of open star clusters, h and Chi Persei. Also cataloged as NGC 869 (top) and NGC 884, both clusters are about 7,000 light-years away and contain stars much younger and hotter than the Sun.  Separated by only a few hundred light-years, the clusters are both 13 million years young based on the ages of their individual stars, evidence that they were likely a product of the same star-forming region. Always a rewarding sight in binoculars, the Double Cluster is even visible to the unaided eye from dark locations. But a shroud of guitar strings was used to produce diffraction spikes on the colorful stars imaged in this vibrant telescopic view.   Global Moon Party:  Including APOD's Best Moon Images: Saturday, October 9",

//  "hdurl": "https://apod.nasa.gov/apod/image/2110/doubleclustergroves.jpg",

//  "media_type": "image",

//  "service_version": "v1",

//  "title": "The Double Cluster in Perseus",

//  "url": "https://apod.nasa.gov/apod/image/2110/doubleclustergroves1024.jpg"
//}
