//
//  NetworkRequestHelper.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 9/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol DataSyncronizedProtocol {
    func dataSyncronized()
}

class NetworkRequestHelper: NSObject {
    
    var delegate : DataSyncronizedProtocol?
    let urlServices = "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    
    func syncData() {
        
        Alamofire.request(urlServices).responseObject { (response: DataResponse<JsonMap>) in
            
            if response.result.value != nil {
                JsonInfoDTO.sharedJsonInfoDTO.jsonMap = response.result.value
                    self.delegate?.dataSyncronized()
            } else {
                print("Request Error")
            }
        }
    }
    

}

