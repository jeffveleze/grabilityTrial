//
//  JsonInfoDTO.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 14/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit

class JsonInfoDTO: NSObject {
    
    //MARK: Shared Instance
    static let sharedJsonInfoDTO = JsonInfoDTO()
    
    let urlServices = "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    let feed = "feed"
    let entry = "entry"
    let category = "category"
    let attributes = "attributes"
    let label = "label"

    var jsonResponse = [String: Any]()
    var jsonMap: JsonMap?

    
    //This prevents others from using the default '()' initializer for this class.
    private override init() {}
    
    func getCategories() -> Array<String> {
        
        let entry = jsonMap?.feed?.entry
        var categories = Set<String>()
        
        for index in 0...((entry?.count)!-1){
            let category = entry?[index].category?.attributes?.label
            categories.insert(category!)
        }
        
        return Array(categories)
    }
    
    func getEntriesFor(categorySelected: String) -> Array<Entry>{
        
        let entry = jsonMap?.feed?.entry
        var entriesForCategory = Array<Entry>()

        for index in 0...((entry?.count)!-1){
            let category = entry?[index].category?.attributes?.label
            if category == categorySelected {
                entriesForCategory.append((entry?[index])!)
            }
        }
        
        return entriesForCategory
    }

    
}
