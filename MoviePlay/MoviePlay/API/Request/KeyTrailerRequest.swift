//
//  KeyTrailerRequest.swift
//  MoviePlay
//
//  Created by tuyente on 10/3/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class KeyTrailerRequest: BaseRequest {
    required init(id: Int) {
        let body: [String: Any] = [
            "api_key": APIKey.key,
            "language": "en-US"
        ]
        let url = URLs.trailer + "\(id)" + "/videos"
        super.init(url: url, requestType: .get, body: body)
    }
}

