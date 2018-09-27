//
//  ListMovieType.swift
//  MoviePlay
//
//  Created by tuyente on 9/26/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

enum ListMovieType {
    case nowPlaying
    case popular
    case topRated
    case upcoming
    
    var url: String {
        switch self {
        case .nowPlaying:
            return URLs.apiMoviesNowPlaying
        case .popular:
            return URLs.apiMoviesPopular
        case .topRated:
            return URLs.apiMoviesTopRated
        case .upcoming:
            return URLs.apiMoviesUpcoming
        }
    }
    
    var name: String {
        switch self {
        case .nowPlaying:
            return "NowPlaying "
        case .popular:
            return "Popular"
        case .topRated:
            return "TopRated"
        case .upcoming:
            return "Upcoming"
        }
    }
}
