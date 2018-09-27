//
//  ImageRequest.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

class ListMovieRequest: BaseRequest {
    
    required override init(url: String) {
        let body: [String: Any] = [
            "api_key": APIKey.key
        ]
        super.init(url:url, requestType: .get, body: body)
    }
}
