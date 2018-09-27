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
    
    public static let apiMoviesByGenres = aPIBaseUrl + "/movie/"
    
    public static let apiMoviesNowPlaying = aPIBaseUrl + "/movie/now_playing"
    
    public static let apiMoviesPopular = aPIBaseUrl + "/movie/popular"
    
    public static let apiMoviesTopRated = aPIBaseUrl + "/movie/top_rated"
    
    public static let apiMoviesUpcoming = aPIBaseUrl + "/movie/upcoming"
    
    public static let urlPosterImage = "https://image.tmdb.org/t/p/w300_and_h450_bestv2"
    
}

