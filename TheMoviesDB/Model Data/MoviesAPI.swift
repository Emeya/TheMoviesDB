//
//  MoviesAPI.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 19/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import Foundation

struct MoviesJson: Decodable {
    let results : [Results]?
}

struct Results : Decodable {
    let id : Int?
    let title : String?
    let poster_path : String?
    let vote_average : Float?
    let release_date : String?
}

struct MovieDetail : Decodable {
    let backdrop_path : String?
    let runtime : Int?
    let overview : String?
    let genres: [Genres]?
    
    //Need to init, thx medium
    init() {
        self.backdrop_path = ""
        self.genres = [Genres]()
        self.runtime = 0
        self.overview = ""
    }
}

struct Genres : Decodable {
    let id : Int?
    let name: String?
}
