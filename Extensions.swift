//
//  Extensions.swift
//  GrabilityTrial
//
//  Created by Jefferson Velez on 12/17/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        
        contentMode = mode
        var image = UIImage()
        if isConnectionAvailble(){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let data = data, error == nil{
                    image = UIImage(data: data)!
                }else {
                    image = #imageLiteral(resourceName: "NoInternet")
                    print("Error loading image")
                }
                DispatchQueue.main.async() { () -> Void in
                    self.image = image
                }
                }.resume()
        }else{
            image = #imageLiteral(resourceName: "NoInternet")
            print("Turn the wifi on")
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
        }
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
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
