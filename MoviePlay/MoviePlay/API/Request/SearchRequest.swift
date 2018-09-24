//
//  SearchRequest.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

class SearchRequest: BaseRequest {
    required init(language:String , page: Int ,query:String  ) {
        let body: [String:Any] = [
            "language": language,
            "page": page,
            "query": query
            ]
        super.init(url:URLs.aPISearchCollection, requestType: .get, body: body)
    }
}
