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
        tv.backgroundColor = .clear
        return tv
    }()
    
    var idMovie : Int?
    var movieTitle : String?
    var votesAVG : Float?
    var date : String?
    
    var movieDetail = MovieDetail()
    var genreArray = [String]()
    var posterImages = UIImage()
    let posterUrl = "https://image.tmdb.org/t/p/w342"
    
    let movieDescCellID = "movieDescCellID"
    var fetchingDescAlert : UIAlertController?
    
    //MARK:- Load and Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViewLoad()
    }
    
    func setupViewLoad(){
        view.backgroundColor = .white
        self.setupTableView()
        self.getMovieDetails()
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
        
        guard let idMovie = idMovie else {return}
        let jsonUrlString = "https://api.themoviedb.org/3/movie/\(idMovie)?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-ES"
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
                
                self.movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                //MARK: Need the genre array.
                for tag in self.movieDetail.genres! {
                    self.genreArray.append(tag.name!)
                }
                self.getMoviePoster()
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                self.showConnectionErrorAlert()
                return
            }
        }.resume()
        
    }//details
    
    func getMoviePoster(){
        guard let imgUrl = self.movieDetail.backdrop_path else {return}
        guard let url = URL(string: posterUrl + imgUrl ) else { return }
        do {
            let imgData = try Data(contentsOf: url)
            posterImages = UIImage(data: imgData)!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
            self.showConnectionErrorAlert()
            return
        }
        
    }//get posters
    
    
    func showConnectionErrorAlert(){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "No podemos cargar la imagen, revisa tu conexión a internet", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reintentar Conexion?", style: .default, handler: { (_) in
                self.getMovieDetails()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { (_) in
                alert.dismiss(animated: true)
            }))
            
            self.present(alert, animated: true)
        }
    }
    
}//end code
