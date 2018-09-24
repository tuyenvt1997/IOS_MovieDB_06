//
//  TitleResponse.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import ObjectMapper

class TitleResponse: Mappable {
    var titles = [Title]()
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        titles <- map ["genres"]
    }
   
}
