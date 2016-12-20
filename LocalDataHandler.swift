//
//  LocalDataHandler.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 16/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit

class LocalDataHandler: NSObject {
    
    var extendedPath = "/Library/Caches/ServiceData.json"
    
    override init(){}
    
    func saveFile(jsonToSave:JsonMap)
    {
        let jsonMap = jsonToSave.toJSONString()
        let filePath = NSHomeDirectory() + "/Library/Caches/jsonData.json"
        do {
            _ = try jsonMap?.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func readFile() -> String
    {
        var readString = ""
        let filePath = NSHomeDirectory() + "/Library/Caches/jsonData.json"
        do {
            readString = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue) as String
        } catch let error as NSError {
            print(error.description)
            print("You need to connect to internet at least once")
        }
        return readString
    }
    
    func saveFileStatus(savingStatus: Bool) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(savingStatus, forKey: "isDataSaved")
    
        //Save the changes
        userDefaults.synchronize()
    }
    
    func fileWasSaved()-> Bool{
        let userDefaults = UserDefaults.standard
        let dataIsSaved = userDefaults.object(forKey: "isDataSaved")
        return (dataIsSaved != nil)
    }
    
}
