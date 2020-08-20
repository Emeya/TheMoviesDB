//
//  MovieDescriptionView.swift
//  TheMoviesDB
//
//  Created by Manuel Soberanis on 20/08/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MovieDescriptionView: UIViewController {

    //MARK: - Components
    let tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        return tv
    }()
    
    
    var idMovie : Int?
    var movieTitle : String?
    var votesAVG : Float?
    var date : String?
    
    var movieDetail = MovieDetail()
    var posterImages = UIImage()
    let imageUrl = "https://image.tmdb.org/t/p/w342"
    
    let movieDescCellID = "movieDescCellID"
    var fetchingDescAlert : UIAlertController?
    
    //MARK:- Load and Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViewLoad()
    }
    
    func setupViewLoad(){
        self.title = "Desc view"
        view.backgroundColor = .white
        self.setupTableView()
        self.getMovieDetails()
        
//        print(self.movieTitle)
    }

    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieDescCell.self, forCellReuseIdentifier: movieDescCellID)
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: - Functions
    
    func getMovieDetails(){
//        self.fetchingDescAlert = UIAlertController(title: "Fetching Movies", message: "\n\n", preferredStyle: .alert)
//        self.fetchingDescAlert?.addSpinner()
//        present(self.fetchingDescAlert!, animated: true)
        
        guard let idMovie = idMovie else {return}
        let jsonUrlString = "https://api.themoviedb.org/3/movie/\(idMovie)?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-ES"
        guard let urlReq = URL(string: jsonUrlString) else { return }
        let url = URLRequest(url: urlReq)
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
            do {
                
                self.movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                self.getMoviePoster()
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                return
            }
        }.resume()
        
    }//details
    
    func getMoviePoster(){
//        posterImages.removeAll()
//        for item in movieDetail {
        guard let posterUrl = self.movieDetail.backdrop_path else {return}
            guard let url = URL(string: imageUrl + posterUrl ) else { return }
            do {
                let imgData = try Data(contentsOf: url)
//                print(imgData)
                posterImages = UIImage(data: imgData)!
//                posterImages.append(UIImage(data: imgData)!)
            }catch{
            }

//        }
        DispatchQueue.main.async {
//            self.fetchingDescAlert?.dismiss(animated: true, completion: {
                self.tableView.reloadData()
//            })
        }
    }//get posters
    
}//end code
