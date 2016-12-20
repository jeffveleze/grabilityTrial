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
    var localDataHandler = LocalDataHandler()
    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.logo.image = #imageLiteral(resourceName: "iTunes")
        self.name.text = "iTunes Store: Top Free Apps"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rotateViewToRight(self.logo, duration: 2.0, delay: 0.0)

        // Expand and Shrink Title
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            
            self.name.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { finish in
            UIView.animate(withDuration: 0.6, animations: {
                self.name.transform = CGAffineTransform.identity
            })
        }
        
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
            sleep(2)
            self.checkIfMayGoToNextView()
        })
        
    }
    
    func checkIfMayGoToNextView(){
        if(self.networkHelper.isConnectionAvailble()){
            self.performSegue(withIdentifier: "showCategories", sender: nil)
        }else{
            if(self.localDataHandler.fileWasSaved()){
                self.performSegue(withIdentifier: "showCategories", sender: nil)
            }else{
                self.handleAlertView()
            }
        }
    }

    func handleAlertView(){
        
        let alert = UIAlertController(title: "Alerta", message: "Necesitas una conexión a internet al menos la primera vez que uses la app. Asegúrate de tener una y presiona reintentar", preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                self.checkIfMayGoToNextView()
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }
        }))
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
