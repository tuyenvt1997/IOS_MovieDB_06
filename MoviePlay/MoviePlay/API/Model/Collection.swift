//
//  Genres.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//
import Foundation
import ObjectMapper

class Collection {
    var id: Int = 0
    var name = ""
    var originalLanguage = ""
    var originalName = ""
    var overview = ""
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map) {
        id <- map ["id"]
        name <- map["name"]
        originalLanguage <- map ["original_language"]
        originalName <- map ["original_name"]
        overview <- map ["overview"]
    }
}
