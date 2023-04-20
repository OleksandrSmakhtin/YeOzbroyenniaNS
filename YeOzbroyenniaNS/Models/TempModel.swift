//
//  TempModel.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 17.04.2023.
//

import Foundation


class DataPersistance {
    
    static let shared = DataPersistance()
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    lazy var data = [
        ""

    ]
    
    
    func encodeData() -> String {
        encoder.outputFormatting = .prettyPrinted
        var result = ""
        
        do {
            let jsonData = try encoder.encode(data)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                result = jsonString
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        return result
    }
    
    
    
    
    let mainURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    func getData() -> [Item] {
        
        let jsonURL = mainURL.appending(path: "allGuns.json")
        print(jsonURL)
        var items = [Item]()
        var jData = Data()
        
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            jData = jsonData
        } catch {
            print(error.localizedDescription)
        }
        
        do {
            items = try decoder.decode([Item].self, from: jData)
        } catch {
            print(error.localizedDescription)
        }
        
        
        
        
        return items
    }
    
    
}


class FileHandler {
    
    static let shared = FileHandler()
    
    let fileManager = FileManager.default
    let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    
    func saveJson(json: String) {
        let jsonURL = docDirectory.appending(path: "second.json")
        
        do {
            try json.write(toFile: jsonURL.path(), atomically: true, encoding: .utf8)
            print("JSON записан в файл: \(jsonURL)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
