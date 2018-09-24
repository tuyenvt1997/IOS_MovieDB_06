//
//  Urls.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

struct URLs {
    private static var aPIBaseUrl = "https://api.themoviedb.org/3"
    
    public static let aPISearchCollection = aPIBaseUrl + "/search/collection"
    
    public static let aPITitleCollection = aPIBaseUrl + "/genre/movie/list"
}

