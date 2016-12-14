//
//  LastKeyString.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 14/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import Foundation
import ObjectMapper

class LastKeyString: Mappable{
    
    var label: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        label <- map["label"]
        
    }
}
