//
//  BaseDataAccess.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import CoreData
import RxSwift

public class BaseDataAccess {
    public static let shared = BaseDataAccess()
    let identifier: String = "com.cat.tinder.TinderCatData"
    let model: String = "TinderCatData"

    lazy var persistentContainer: NSPersistentContainer = {
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)

        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in

            if let err = error {
                fatalError("❌ Loading of store failed:\(err)")
            }
        }

        return container
    }()
    
    func save(breed: FavoriteDao) {

        let context = persistentContainer.viewContext
        let favoriteEntity = NSEntityDescription.entity(forEntityName: "Favorite", in: context)

        let favoriteModel = NSManagedObject(entity: favoriteEntity!, insertInto: context)
        favoriteModel.setValue(breed.name, forKey: "name")
        favoriteModel.setValue(breed.image, forKey: "image")

        do {
            try context.save()
            print("✅ Favorite saved succesfuly")
            fetch().forEach { (favorite) in
                print("Item \(String(describing: favorite.image))")
            }
            

        } catch let error {
            print("❌ Favorite to create Person: \(error.localizedDescription)")
        }
    }

    public func fetch() -> [Favorite] {

        let context = persistentContainer.viewContext

        var list: [Favorite] = []
        let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")

        do {

            let favorites = try context.fetch(fetchRequest)

            for (index, favorite) in favorites.enumerated() {
                list.append(favorite)
                print("Item \(String(describing: favorite.image))")

                print(index)
            }
            
            return list

        } catch let fetchErr {
            print("❌ Failed to fetch Favorite:", fetchErr)
            return list
        }
    }
}
