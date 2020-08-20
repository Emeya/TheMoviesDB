//
//  MovieDescriptionView+TableView.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 20/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import Foundation
import UIKit

extension MovieDescriptionView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieDescCellID, for: indexPath) as! MovieDescCell
        cell.selectionStyle = .none
        cell.movieHeader.image = posterImages
        cell.movieTitle.text = self.movieTitle
        cell.runtimeValue.text = "\(movieDetail.runtime!) min"
        cell.releaseValue.text = self.date
        cell.calificacionValue.text = "\(movieDetail.vote_average!)"
        //MARK: need ,
        cell.generosValue.text = genreArray.joined(separator: ", ")
        cell.desctipcionValue.text = movieDetail.overview
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
