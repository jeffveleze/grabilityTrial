//
//  DetailsViewController.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 19/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet var image: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var summary: UILabel!
    var entrySelected: Entry?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadAndDisplayData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAndDisplayData() {
    
        let name = self.entrySelected?.name?.label
        let author = self.entrySelected?.artist?.label
        let category = self.entrySelected?.category?.attributes?.label
        let summary = self.entrySelected?.summary?.label
        let url = self.entrySelected?.image?[2].label
        
        self.name.text = name
        self.author.text = author
        self.category.text = category
        self.summary.text = summary
        self.image.downloadedFrom(link: url!)

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
