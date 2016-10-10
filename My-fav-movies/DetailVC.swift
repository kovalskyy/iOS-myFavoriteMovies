//
//  DetailVC.swift
//  My-fav-movies
//
//  Created by Kacper Kowalski on 03.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit


class DetailVC: UIViewController {
    
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieLink: UILabel!
    
    var showMovie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theMovie = showMovie {
            
            movieImg.layer.cornerRadius = movieImg.frame.size.width / 15.0
            movieImg.clipsToBounds = true
        
            
            movieImg.image = theMovie.getMovieImg()
            movieLink.text = theMovie.link
            movieDesc.text = theMovie.desc
            movieDesc.sizeToFit()
  

        }
    }
    
       override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "movieLink" {
            if let linkViewController = segue.destinationViewController as? LinkViewVC {
                linkViewController.link = showMovie.link
            
                
                
                
            }
            
        }
        
    }

}

