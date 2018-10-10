//
//  SearchResponse.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchResponse: Mappable {
    var page = 0
    var totalPages = 0
    var movies = [Movie]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        movies <- map["results"]
        page <- map["page"]
        totalPages <- map["total_pages"]
    }
}
