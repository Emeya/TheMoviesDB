//
//  MoviesListCell.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 19/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MoviesListCell: UICollectionViewCell {
    
    //MARK: - Components
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let posterImage : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    let movieTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let labelsContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    let imageUrl = "https://image.tmdb.org/t/p/w342"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayout()
    }
    
    //MARK: - Layout
    func setupLayout(){
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        containerView.addSubview(posterImage)
        posterImage.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        posterImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        posterImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        containerView.addSubview(labelsContainer)
        labelsContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        labelsContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        labelsContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        containerView.addSubview(dateLabel)
        dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
        containerView.addSubview(movieTitle)
        movieTitle.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -15).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        labelsContainer.topAnchor.constraint(equalTo: movieTitle.topAnchor, constant: -5).isActive = true
    }
    
    
    //MARK: - Setting values
    
    var movieResults: Results? {
        didSet {
            guard let movieData = movieResults else { return }
            
            movieTitle.text = movieData.title
            dateLabel.text = movieData.release_date

//            guard let posterUrl = movieData.poster_path else {return}
//            self.getImageData(posterUrl: posterUrl)
        }
    }//didset
    
    
    //MARK: Not a good idea.
//    func getImageData(posterUrl: String){
//        guard let url = URL(string: imageUrl+posterUrl) else { return }
//        do {
//            let imgData = try Data(contentsOf: url)
//
//            DispatchQueue.main.async {
//                self.posterImage.image = UIImage(data: imgData)
//            }
//        }catch{
//        }
//    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}//end code
