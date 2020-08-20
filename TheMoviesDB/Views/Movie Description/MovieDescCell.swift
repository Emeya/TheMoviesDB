//
//  MovieDescCell.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 20/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MovieDescCell: UITableViewCell {

    //MARK: - Components

    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let movieHeader : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    let movieTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()

    let runtimeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Duración:"
        return label
    }()
    let runtimeValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    let releaseLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Fecha de estreno:"
        return label
    }()

    let releaseValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    let calificacionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Calificación:"
        return label
    }()
    
    let calificacionValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    let generosLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Géneros:"
        return label
    }()
    
    let generosValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    let desctipcionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Descripción:"
        return label
    }()
    
    let desctipcionValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    let stackView : UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
    }()

    let bottomView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let textView : UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textAlignment = .left
        return tv
    }()

    let separatorValue : CGFloat = 10

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setupViews()
    }

    //MARK: - Layout
    func setupViews(){
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        containerView.addSubview(movieHeader)
        movieHeader.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        movieHeader.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        movieHeader.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

        containerView.addSubview(movieTitle)
        movieTitle.topAnchor.constraint(equalTo: movieHeader.bottomAnchor, constant: 15).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true

        containerView.addSubview(runtimeLabel)
        runtimeLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20).isActive = true
        runtimeLabel.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        runtimeLabel.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(runtimeValue)
        runtimeValue.topAnchor.constraint(equalTo: runtimeLabel.bottomAnchor, constant: 0).isActive = true
        runtimeValue.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        runtimeValue.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(releaseLabel)
        releaseLabel.topAnchor.constraint(equalTo: runtimeValue.bottomAnchor, constant: separatorValue).isActive = true
        releaseLabel.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        releaseLabel.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(releaseValue)
        releaseValue.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: 0).isActive = true
        releaseValue.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        releaseValue.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(calificacionLabel)
        calificacionLabel.topAnchor.constraint(equalTo: releaseValue.bottomAnchor, constant: separatorValue).isActive = true
        calificacionLabel.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        calificacionLabel.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(calificacionValue)
        calificacionValue.topAnchor.constraint(equalTo: calificacionLabel.bottomAnchor, constant: 0).isActive = true
        calificacionValue.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        calificacionValue.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(generosLabel)
        generosLabel.topAnchor.constraint(equalTo: calificacionValue.bottomAnchor, constant: separatorValue).isActive = true
        generosLabel.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        generosLabel.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(generosValue)
        generosValue.topAnchor.constraint(equalTo: generosLabel.bottomAnchor, constant: 0).isActive = true
        generosValue.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        generosValue.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(desctipcionLabel)
        desctipcionLabel.topAnchor.constraint(equalTo: generosValue.bottomAnchor, constant: separatorValue).isActive = true
        desctipcionLabel.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        desctipcionLabel.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
        
        containerView.addSubview(desctipcionValue)
        desctipcionValue.topAnchor.constraint(equalTo: desctipcionLabel.bottomAnchor, constant: 0).isActive = true
        desctipcionValue.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor).isActive = true
        desctipcionValue.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true

        containerView.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: desctipcionValue.bottomAnchor, constant: 10).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}// end

