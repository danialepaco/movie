//
//  CoreDataManager.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
  
  static let sharedManager = CoreDataManager()
  
  private init() {}
  
  lazy var persistentContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "movie")
    
    
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  func saveContext () {
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
  /*Insert*/
  func insertPerson(name: String, id: Int32, image: String, isFavorite: Bool) {
    
    let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Serie",
                                          in: managedContext)!
    
    let serie = NSManagedObject(entity: entity,
                                 insertInto: managedContext)
    
    serie.setValue(name, forKeyPath: "name")
    serie.setValue(id, forKeyPath: "id")
    serie.setValue(image, forKeyPath: "image")
    serie.setValue(isFavorite, forKeyPath: "isFavorite")

    do {
      try managedContext.save()
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }
  
  func fetchAllSeries() -> [Serie]? {
    
    let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext

    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Serie")
    
    do {
      let serie = try managedContext.fetch(fetchRequest)
      return serie as? [Serie]
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      return nil
    }
  }
  
  func delete(id: Int32) -> [Serie]? {
    
    let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Serie")
    
    fetchRequest.predicate = NSPredicate(format: "id == %d" ,id)
    do {
      
      let item = try managedContext.fetch(fetchRequest)
      var arrRemovedPeople = [Serie]()
      for i in item {
        
        managedContext.delete(i)
        try managedContext.save()
        
        arrRemovedPeople.append(i as! Serie)
      }
      return arrRemovedPeople
      
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      return nil
    }
  }
}

