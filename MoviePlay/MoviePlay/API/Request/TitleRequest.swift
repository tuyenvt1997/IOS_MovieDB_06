//
//  titleRequest.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

class TitleRequest: BaseRequest {
    
    required init() {
        let body: [String: Any] = [
            "api_key": APIKey.key
        ]
        super.init(url:URLs.apiTitleCollection, requestType: .get, body: body)
    }
}
