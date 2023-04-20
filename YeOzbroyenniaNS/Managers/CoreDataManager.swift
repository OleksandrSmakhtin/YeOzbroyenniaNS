//
//  CoreDataManager.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 20.04.2023.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    
    
    //MARK: - Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    //MARK: - Add
    func addItem(with title: String) {
        let item = CoreItem(context: context)
        item.title = title
        do {
            try context.save()
            print("Successfully saved Item to CoreData")
        } catch {
            print("Failed to add Item to CoreData due to: \(error.localizedDescription)")
        }
    }
    
    
    
    
    //MARK: - Fetch
    func fetchItems() -> [String] {
        var results = [String]()
        let request = CoreItem.fetchRequest()
        do {
            let items = try context.fetch(request)
            results = items.map({ item in
                guard let title = item.title else { return ""}
                return title
            })
            print("Successfully fetched Items from CoreData")
        } catch {
            print("Failed to fetch Items from CoreData due to: \(error.localizedDescription)")
        }
        return results
    }
    
    
    
    
    //MARK: - Delete
    func deleteItem(item: CoreItem) {
        context.delete(item)
        do {
            try context.save()
            print("Successfully deleted Item from CoreData")
        } catch {
            print("Failed to delete Item from CoreData due to: \(error.localizedDescription)")
        }
    }
    
    
}
