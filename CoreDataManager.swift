//
//  CoreDataManager.swift
//  IvyFEb
//
//  Created by Alaa Alabdullah on 30/03/2023.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var habit: [Habit] = []
    
    init() {
        container =  NSPersistentContainer(name: "IvyCoreDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("error loading data \(error)")
            }
        }
        // call the function that fetches your core data
        fetchHabit()
    }
    
    
    func fetchHabit() {
        // send a request to fetch data
        let request = NSFetchRequest<Habit>(entityName: "Habit")
        // fetching
        do {
           habit = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching \(error)")
        }
    }
    
    
    
    func fetchByname(name: String) -> Habit {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        fetchRequest = Habit.fetchRequest()
        
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(
            format: "name LIKE %@", name
        )

        let context = container.viewContext
        
        let objects =   try! context.fetch(fetchRequest).first
        print("objects : \( String(describing: objects))")
        return objects! as! Habit
    }
    
    func isItOnCoredata(name: String) -> Bool{
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        fetchRequest = Habit.fetchRequest()
        // Configure a fetch request to fetch at most 1 result
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(
            format: "name LIKE %@", name
        )

        // Get a reference to a NSManagedObjectContext
        let context = container.viewContext
        // Perform the fetch request to get the objects
        // matching the predicate
        let objects =   try! context.fetch(fetchRequest).first
        print("objects : \( String(describing: objects))")
        return (objects != nil)
    }
    
    // adding new item if doesnt exist -- add the condition here
    func addItem(name: String, points: Int16){
        withAnimation {
           
            // creating new item
            let habit = Habit(context: container.viewContext)
            habit.name = name
            habit.points = points
            
            saveItems()
        }
    }
    
    func getAllHabits() ->[Habit]{
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        do{
            return try container.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }

    }
    
    
    func saveItems() {
       do {
           try container.viewContext.save()
           fetchHabit()
       } catch {
           print("error saving")
       }
   }
    
    
}
