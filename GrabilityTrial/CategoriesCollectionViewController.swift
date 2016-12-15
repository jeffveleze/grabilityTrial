//
//  CategoriesCollectionViewController.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 13/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit

class CategoriesCollectionViewController: UICollectionViewController, DataSyncronizedProtocol {
    
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var activityIndicator = UIActivityIndicatorView()
    var networkHelper = NetworkRequestHelper()
    var categories = Array<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkHelper.delegate = self;
        self.networkHelper.syncData()
        self.launcActivityIndicator()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func launcActivityIndicator(){
        self.activityIndicator.center = self.view.center
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.activityIndicator.tintColor = UIColor.green
        self.view.addSubview(self.activityIndicator)
        disableViewElements()
        
        self.activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(){
        self.activityIndicator.stopAnimating()
        self.enableViewElements()
    }
    
    func enableViewElements(){
        self.view.endEditing(false)
        self.view.isUserInteractionEnabled = true
        self.navigationController?.view.isUserInteractionEnabled = true
    }
    
    func disableViewElements(){
        self.view.endEditing(true)
        self.view.isUserInteractionEnabled = false
        self.navigationController?.view.isUserInteractionEnabled = false
    }
    
    func dataSyncronized(){
        loadViewData()
        hideActivityIndicator()
    }
    
    func loadViewData(){
        self.categories = JsonInfoDTO.sharedJsonInfoDTO.getCategories()
        self.collectionView?.reloadData()
        
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.categories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "CategoriesCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CategoriesCollectionViewCell
        
        let category = self.categories[indexPath.row]
        cell.categoryName.text = category
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let categorySelected = self.categories[indexPath.item]
        self.performSegue(withIdentifier: "showApps", sender: categorySelected)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (self.itemsPerRow + 1)
        let availableWidth = self.view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let appsViewController = segue.destination as! AppsCollectionViewController
        appsViewController.categorySelected = sender as! String
     }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
