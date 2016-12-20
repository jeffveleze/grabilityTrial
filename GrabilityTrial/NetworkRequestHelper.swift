//
//  NetworkRequestHelper.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 9/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit
import SystemConfiguration
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

protocol DataSyncronizedProtocol {
    func dataSyncronized()
}

class NetworkRequestHelper: NSObject {
    
    var delegate : DataSyncronizedProtocol?
    let urlServices = "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    var localDataHandler = LocalDataHandler()
    
    func syncData() {
        
        Alamofire.request(urlServices).responseObject { (response: DataResponse<JsonMap>) in
            
            switch response.result {
            case .success:
                if response.result.value != nil {
                    JsonInfoDTO.sharedJsonInfoDTO.jsonMap = response.result.value
                    self.localDataHandler.saveFile(jsonToSave: response.result.value!)
                    self.localDataHandler.saveFileStatus(savingStatus: true)
                    self.delegate?.dataSyncronized()
                } else {
                    print("Request Error")
                }
            case .failure(let error):
                print(error)
                print("Data loaded from local")
                let jsonString:String = (self.localDataHandler.readFile())
                JsonInfoDTO.sharedJsonInfoDTO.jsonMap = Mapper<JsonMap>().map(JSONString: jsonString)
                self.delegate?.dataSyncronized()
            }
            
        }
    }
    
    func isConnectionAvailble()->Bool{
        
        let rechability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, "www.google.com")
        var flags : SCNetworkReachabilityFlags = SCNetworkReachabilityFlags()
        if SCNetworkReachabilityGetFlags(rechability!, &flags) == false {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
    }
    

}

