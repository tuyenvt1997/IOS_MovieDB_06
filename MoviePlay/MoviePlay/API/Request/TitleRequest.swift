//
//  titleRequest.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

class TitleRequest: BaseRequest {
    
    required init(language: String) {
        let body: [String: Any] = [
            "language": language
        ]
        super.init(url:URLs.aPITitleCollection, requestType: .get, body: body)
    }
}
