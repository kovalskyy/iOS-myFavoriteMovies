//
//  MovieCell.swift
//  My-fav-movies
//
//  Created by Kacper Kowalski on 02.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    
    }

    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.title
        movieDesc.text = movie.desc
        movieImg.image = movie.getMovieImg()
        movieDesc.sizeToFit()
        
    }
    
    
   
    

}
