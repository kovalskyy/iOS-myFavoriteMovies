//
//  CreateMovieVC.swift
//  My-fav-movies
//
//  Created by Kacper Kowalski on 02.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit
import CoreData

class CreateMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieLink: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var imagePicker: UIImagePickerController!


    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = movieImg.frame.size.width / 10.0
        movieImg.clipsToBounds = true
        
        
        
    }

  
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
        
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func createMovieList(sender: AnyObject!) {
        if let title = movieTitle.text where title != "" {
            
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
                let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            
            movie.title = title
            movie.desc = movieDesc.text
            movie.link = movieLink.text
            movie.setMovieImage(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Could not save movie!")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
            }
            
        }
    }

 

