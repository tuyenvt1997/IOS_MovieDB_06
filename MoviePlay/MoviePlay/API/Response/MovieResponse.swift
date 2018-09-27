//
//  ImageResponse.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieResponse: Mappable {
    var movies = [Movie]()
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        movies <- map ["results"]
    }
    
}
