//
//  Entry.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 14/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import Foundation
import ObjectMapper

class Entry: Mappable {
    
    var name : LastKeyString?
    var image : String?
    var summary : String?
    var artist : String?
    var category : String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["im:name"]
        image <- map["im:image"]
        summary <- map["summary"]
        artist <- map["im:artist"]
        category <- map["category"]
        
    }
    
}
