//
//  MoviesListView+CollectionView.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 19/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import Foundation
import UIKit

extension MoviesListView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: moviesListCellID, for: indexPath) as! MoviesListCell
        movieCell.backgroundColor = .clear
        movieCell.movieResults = results[indexPath.row]
        movieCell.posterImage.image = posterImages[indexPath.row]
        return movieCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (view.frame.width - (numberItems - 1) * interlineSpace) / numberItems
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let width = screenWidth / numberItems
        let height = width * 1.51098 //the aspect ratio of a movie poster is 27:41
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    

    
    
}//end
