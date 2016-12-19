//
//  SplashViewController.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 19/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var networkHelper = NetworkRequestHelper()
    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set up the UI
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.logo.image = #imageLiteral(resourceName: "iTunes")
        self.name.text = "iTunes Store: Top Free Apps"
        // Dissapear elements from main window to animate later
        self.logo.center.y -= view.bounds.height
        self.name.center.y -= view.bounds.height
        self.logo.center.x -= view.bounds.width
        self.name.center.x -= view.bounds.width
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Move TextField
        UIView.animate(withDuration: 0.5, delay: 1.0, options: [], animations: {
            self.logo.center.x += self.view.bounds.width
        }, completion: nil)
        
        // Move TextField
        UIView.animate(withDuration: 0.5, delay: 1.5, options: [], animations: {
            self.name.center.x += self.view.bounds.width
        }, completion: nil)
        
        rotateViewToRight(self.logo, duration: 2.0, delay: 0.0)


    }
    
    func rotateViewToRight(_ image: UIImageView, duration: Double, delay: Double){
        
        let fullRotation = CGFloat.pi * 2
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: [UIViewKeyframeAnimationOptions.calculationModeLinear], animations: {
            
            // First Lap
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/6, animations: {
                image.transform = CGAffineTransform(rotationAngle: 1/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 1/6, animations: {
                image.transform = CGAffineTransform(rotationAngle: 2/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/6, relativeDuration: 1/6, animations: {
                image.transform = CGAffineTransform(rotationAngle: 3/3 * fullRotation)
            })
            
            // Second Lap
            UIView.addKeyframe(withRelativeStartTime: 3/6, relativeDuration: 1/6, animations: {
                image.transform = CGAffineTransform(rotationAngle: 1/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 4/6, relativeDuration: 1/6, animations: {
                image.transform = CGAffineTransform(rotationAngle: 2/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 5/6, relativeDuration: 1/6, animations: {
                image.transform = CGAffineTransform(rotationAngle: 3/3 * fullRotation)
            })
        }, completion: {finished in
            // any code entered here will be applied once the animation has completed
        })
        
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
