//
//  MoviesAPI.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 19/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import Foundation

struct MoviesJson: Codable {
    let results : [Results]?
}

struct Results : Codable {
    let title : String?
    let poster_path : String?
    let vote_average : Float?
    let release_date : String?
}

struct MovieDetail : Codable {
    let backdrop_path : String?
    let runtime : String?
    let overview : String?
    let genres: [Genres]?
}

struct Genres : Codable {
    let id : Int?
    let name: String?
}
