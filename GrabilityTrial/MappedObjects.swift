//
//  Entry.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 14/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import Foundation
import ObjectMapper

class JsonMap:  Mappable{
    
    var feed : Feed?
    
    required init?(map: Map) {
        
    }
    
    init()
    {
        //New Instance initialization goes here
    }

    func mapping(map: Map) {
        feed <- map["feed"]
    }
}
class Feed: Mappable {
    
    var entry : [Entry]?
    var title : Label?
    var icon : Label?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        entry <- map["entry"]
        title <- map["title"]
        icon <- map["icon"]
    }
}

class Entry: Mappable {
    
    var name : Label?
    var image : [Image]?
    var summary : Label?
    var artist : Artist?
    var category : Category?

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

class Image: Mappable {
    
    var label : String?
    var attributes : AttributesImage?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        attributes <- map["attributes"]
    }
}

class AttributesImage: Mappable {
    
    var height : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        height <- map["height"]
    }
}

class Artist: Mappable {
    
    var label : String?
    var attributes : AttributesArtist?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        attributes <- map["attributes"]
    }
}

class AttributesArtist: Mappable {
    
    var href : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        href <- map["href"]
    }
}

class Category: Mappable {
    
    var attributes : Label?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        attributes <- map["attributes"]
    }
}

class Label: Mappable{
    
    var label: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
    }
}
