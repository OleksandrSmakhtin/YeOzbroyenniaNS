//
//  DataManager.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 18.04.2023.
//

import Foundation


class DataManager {
    static let shared = DataManager()
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    //MARK: - Elements
    func getElements(by subcategory: String) -> Element {
        var result = Element(subcategory: "", items: [""])
        guard let path = Bundle.main.path(forResource: "elements", ofType: "json") else { return result}
        do {
            let jsonData = try Data(contentsOf: URL(filePath: path))
            
            let elements = try decoder.decode([Element].self, from: jsonData)
            let selectedElement = elements.first { $0.subcategory == subcategory }
            result = selectedElement!
        } catch {
            print(error.localizedDescription)
        }
        return result
    }
    
    //MARK: - Item
    func getGunItem(by item: String) -> Item {
        var result = Item(item: "", property: [Property]())
        guard let path = Bundle.main.path(forResource: "allGuns", ofType: "json") else { return result }
        do {
            let jsonData = try Data(contentsOf: URL(filePath: path))
            let items = try decoder.decode([Item].self, from: jsonData)
            let selectedItem = items.first { $0.item == item }
            result = selectedItem!
        } catch {
            print(error.localizedDescription)
        }
        
        return result
    }
    
                                    
                                    
                                    
                                    
}
