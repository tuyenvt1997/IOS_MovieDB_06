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
    var collections = [Collection]()
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        collections <- map ["results"]
    }
}
