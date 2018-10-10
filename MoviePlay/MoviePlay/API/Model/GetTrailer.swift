//
//  GetTrailer.swift
//  MoviePlay
//
//  Created by tuyente on 10/3/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import ObjectMapper

class KeyTrailer: BaseModel {
    var id = 0
    var key = ""
    var name = ""
    var site = ""
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        key <- map["key"]
        name <- map["name"]
        site <- map["site"]
    }
}
