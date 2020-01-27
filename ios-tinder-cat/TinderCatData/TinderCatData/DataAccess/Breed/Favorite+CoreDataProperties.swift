//
//  Favorite+CoreDataProperties.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 26/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?

}
