//
//  MoviesListView.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 19/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MoviesListView: UIViewController{

    

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
    let imageUrl = "https://image.tmdb.org/t/p/w342"
    
    var numberItems: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewLoad()
         
    }
    
    func setupViewLoad(){
        self.view.backgroundColor = .white
        self.title = "The Movies DB"
        self.setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMoviesData()
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
    
    func getMoviesData(){
        let jsonUrlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-ES&page=1"
        guard let urlReq = URL(string: jsonUrlString) else { return }
        let url = URLRequest(url: urlReq)
//        guard let idCity = defaultValues.string(forKey: UserDefaults.Keys.currentCity) else { return }
//        url.httpMethod = "GET"
//        let postString = "idCity=\(idCity)"
//        url.httpBody = postString.data(using: String.Encoding.utf8)
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            if err != nil || data == nil {
                print("Client error")
                return
            }
            //also perhaps check response status 200 OK
            guard let response = response as? HTTPURLResponse, (200...209).contains(response.statusCode) else {
                print("Server error")
                return
            }
            guard let data = data else { return }
            print("data",data)
            do {
                let moviesJson = try JSONDecoder().decode(MoviesJson.self, from: data)
                self.results = moviesJson.results!
                
                self.getMoviePoster()
                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                return
            }
        }.resume()

    }//
    
    func getMoviePoster(){
        posterImages.removeAll()
        for item in results {
            guard let url = URL(string: imageUrl + item.poster_path!  ) else { return }
            do {
                let imgData = try Data(contentsOf: url)
                print(imgData)
                posterImages.append(UIImage(data: imgData)!)
            }catch{
            }
            
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
