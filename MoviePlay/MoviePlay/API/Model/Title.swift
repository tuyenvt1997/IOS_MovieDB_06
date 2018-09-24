//
//  Title.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class Title {
    var id: Int = 0
    var name = ""
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map) {
        id <- map ["id"]
        name <- map["name"]
    }
}
