//
//  MoviesListNavController.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 19/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MoviesListNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let moviesListView = MoviesListView()
        self.viewControllers = [moviesListView]
        self.view.backgroundColor = .white
    }
    
}
