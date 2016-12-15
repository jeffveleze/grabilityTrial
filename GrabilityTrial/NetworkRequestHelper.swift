//
//  NetworkRequestHelper.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 9/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

protocol DataSyncronizedProtocol {
    func dataSyncronized()
}

class NetworkRequestHelper: NSObject {
    
    var delegate : DataSyncronizedProtocol?
    let urlServices = "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    
    func syncData() {
        
        /*
        Alamofire.request(urlServices)
            .responseJSON { response in
                if let JSON = response.result.value {
                    JsonInfoDTO.sharedJsonInfoDTO.jsonResponse = JSON as! [String : Any]
                    self.delegate?.dataSyncronized()
                } else {
                    print("Request Error")
                }
            }
        */
 
        
        var mappedJson: JsonMap = JsonMap.init()

        
        Alamofire.request(urlServices)
            .responseJSON { response in
                if let JSON = response.result.value {
                    JsonInfoDTO.sharedJsonInfoDTO.jsonResponse = JSON as! [String : Any]
                    self.delegate?.dataSyncronized()
                    
                    //mappedJson = Mapper<JsonMap>.map(JSON)
                    //appList = Mapper<AppList>().map(valueJSON)!

                    let weatherResponse = response.result.value
                    print(weatherResponse as! NSDictionary)
                } else {
                    print("Request Error")
                }

            }
        
    }
    

}

