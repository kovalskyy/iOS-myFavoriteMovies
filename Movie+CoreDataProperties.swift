//
//  Movie+CoreDataProperties.swift
//  My-fav-movies
//
//  Created by Kacper Kowalski on 02.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var desc: String?
    @NSManaged var image: NSData?
    @NSManaged var link: String?
    @NSManaged var title: String?

}
