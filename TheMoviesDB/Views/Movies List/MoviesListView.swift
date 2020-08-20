//
//  MoviesListView.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 19/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MoviesListView: UIViewController{

    //MARK:- Components
    
    let collectionView : UICollectionView = {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth/2, height: ((screenWidth/2) * 1.51098))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    var results = [Results]()
    var posterImages = [UIImage]()
    let moviesListCellID = "MoviesListCellID"
    let posterUrl = "https://image.tmdb.org/t/p/w342"
    
    var numberItems: CGFloat = 2
    var fetchingDataAlert : UIAlertController?
    
    
    //MARK:- Load and Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewLoad()
         
    }
    
    func setupViewLoad(){
        self.view.backgroundColor = .white
        self.title = "The Movies DB"
        self.setupCollectionView()
        self.getMoviesData()
    }
  
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoviesListCell.self, forCellWithReuseIdentifier: moviesListCellID)
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK:- Functions
    
    func getMoviesData(){
        self.fetchingDataAlert = UIAlertController(title: "Fetching Movies", message: "\n\n", preferredStyle: .alert)
        self.fetchingDataAlert?.addSpinner()
        present(self.fetchingDataAlert!, animated: true)
        let jsonUrlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-ES&page=1"
        guard let urlReq = URL(string: jsonUrlString) else { return }
        let url = URLRequest(url: urlReq)
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            if err != nil || data == nil {
                print("Client error")
                self.showConnectionErrorAlert()
                return
            }
            //also perhaps check response status 200 OK
            guard let response = response as? HTTPURLResponse, (200...209).contains(response.statusCode) else {
                print("Server error")
                self.showConnectionErrorAlert()
                return
            }
            guard let data = data else {
                self.showConnectionErrorAlert()
                return
            }
            do {
                let moviesJson = try JSONDecoder().decode(MoviesJson.self, from: data)
                self.results = moviesJson.results!
                self.getMoviePoster()
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                self.showConnectionErrorAlert()
                return
            }
        }.resume()

    }//movies
    
    func getMoviePoster(){
        posterImages.removeAll()
        for item in results {
            guard let url = URL(string: posterUrl + item.poster_path!  ) else { return }
            do {
                let imgData = try Data(contentsOf: url)
                posterImages.append(UIImage(data: imgData)!)
            }catch{
                self.showConnectionErrorAlert()
                return
            }
        }
        DispatchQueue.main.async {
            self.fetchingDataAlert?.dismiss(animated: true, completion: {
                self.collectionView.reloadData()
            })
        }
        
    }//get posters
    
    func showConnectionErrorAlert(){
        DispatchQueue.main.async {
            self.fetchingDataAlert?.dismiss(animated: true, completion: {
                let alert = UIAlertController(title: "Error", message: "Revisa tu conexion a internet", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Reintentar Conexion?", style: .default, handler: { (_) in
                    self.getMoviesData()
                }))
                
                alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { (_) in
                    alert.dismiss(animated: true)
                }))
                self.present(alert, animated: true)
            })
        }
    }
    
}//end code
