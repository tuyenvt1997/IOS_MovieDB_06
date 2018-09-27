//
//  imageMovie.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    var id: Int = 0
    var title = ""
    var posterPath = ""
    var voteCount = ""
    var voteAverage = ""
    var popularity = ""
    var originalTitle = ""
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    init() {}
    
    func mapping(map: Map) {
       id <- map["id"]
       title <- map["title"]
       posterPath <- map["poster_path"]
       voteCount <- map["vote_count"]
       voteAverage <- map["vote_average"]
       popularity <- map["popularity"]
       originalTitle <- map["original_title"]
    }
    
    func getURLImage() -> String {
        return URLs.urlPosterImage + posterPath + "?api_key=" + APIKey.key
    }
}
