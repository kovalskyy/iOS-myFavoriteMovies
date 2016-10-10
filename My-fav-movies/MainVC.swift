//
//  ViewController.swift
//  My-fav-movies
//
//  Created by Kacper Kowalski on 01.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie] ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    

    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
            
        }   catch let err as NSError {
            print(err.debugDescription)
            
        }
    
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
            
        } else {
            return MovieCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "movieDetail" {
           
            if let cell = sender as? MovieCell, row = tableView.indexPathForCell(cell)?.row, vc = segue.destinationViewController as? DetailVC {
                vc.showMovie = movies[row]
                
                
            }
            

            
            
    
            }
        }
    }
    
    
    
    


    

    
    







