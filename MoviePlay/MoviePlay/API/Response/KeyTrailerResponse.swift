//
//  KeyTrailerResponse.swift
//  MoviePlay
//
//  Created by tuyente on 10/3/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import ObjectMapper

class KeyTrailerResponse: Mappable {
    var id = 0
    var keyTrailers: [KeyTrailer]?
    var name: [KeyTrailer]?
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        keyTrailers <- map["results"]
    }
}
