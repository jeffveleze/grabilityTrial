//
//  NetworkRequestHelper.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 9/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit
import Alamofire

protocol DataSyncronizedProtocol {
    func dataSyncronized()
}

class NetworkRequestHelper: NSObject {
    
    var delegate : DataSyncronizedProtocol?
    let urlServices = "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    let feed = "feed"
    let entry = "entry"
    let category = "category"
    let attributes = "attributes"
    let label = "label"
    
    var jsonResponse = [String: Any]()
    
    func syncData() {
        
        Alamofire.request(urlServices)
            .responseJSON { response in
                if let JSON = response.result.value {
                    self.jsonResponse = JSON as! [String : Any]
                    self.delegate?.dataSyncronized()
                    //print("Json \(self.jsonResponse)")
                } else {
                    print("Request Error")
                }
            }
    }
    
    func getCategories() -> Array<String> {
        
        let dictionary0: NSDictionary = self.jsonResponse[feed] as! NSDictionary
        let array0: NSArray = dictionary0[entry] as! NSArray
        var categories = Set<String>()
    
        for index in 0...(array0.count-1) {
            
            let dictionary1 = array0[index] as! NSDictionary
            let dictionary2 = dictionary1[category] as! NSDictionary
            let dictionary3 = dictionary2[attributes] as! NSDictionary
            let str = dictionary3[label]
            categories.insert(str as! String)
        }
        
        return Array(categories)
    }
    
    
    
    

}


