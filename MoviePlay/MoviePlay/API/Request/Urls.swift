//
//  Urls.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

struct URLs {
    private static var apiBaseUrl = "https://api.themoviedb.org/3"
    
    public static var youtubeURL = "https://www.youtube.com/embed"
    
    public static let apiMovieSearch = apiBaseUrl + "/search/movie"
    
    public static let apiTitleCollection = apiBaseUrl + "/genre/movie/list"
    
    public static let apiMoviesByGenres = apiBaseUrl + "/movie/"
    
    public static let apiMoviesNowPlaying = apiBaseUrl + "/movie/now_playing"
    
    public static let apiMoviesPopular = apiBaseUrl + "/movie/popular"
    
    public static let apiMoviesTopRated = apiBaseUrl + "/movie/top_rated"
    
    public static let apiMoviesUpcoming = apiBaseUrl + "/movie/upcoming"
    
    public static let urlPosterImage = "https://image.tmdb.org/t/p/w300_and_h450_bestv2"
    
    public static let backdropImage = "https://image.tmdb.org/t/p/original"
    
    public static let getTrailer = apiBaseUrl + "/movie/"
}

