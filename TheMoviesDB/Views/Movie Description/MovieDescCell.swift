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
        return view
    }()
    
    let movieHeader : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView : UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textAlignment = .left
        return tv
    }()
    
    var titleText : String?
    
    let duracionTitle = "Duración:"
    var duracionRes : String?
    
    var fecha : String = "Fecha de estreno:"
    var fechaRes : String?
    
    var calificacion: String = "Calificación:"
    var calificacionRes : String?
    
    var genero : String = "Géneros:"
    var generoRes : String?
    
    var descripcion : String = "Descripción:"
    var descripcionRes : String?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        self.setupViews()
        self.setupTextViewContent()
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
        movieHeader.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        containerView.addSubview(textView)
        textView.topAnchor.constraint(equalTo: movieHeader.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -10).isActive = true
        textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        
    }
    
    func setupTextViewContent(){
        guard let title = titleText else {return}
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
        
        textView.attributedText = attributedText
    }
    
    
    //MARK: - Set values
//    var movieResults: MovieDetail? {
//        didSet {
//            guard let movieData = movieResults else { return }
//
//
//        }
//    }//didset
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}// end
