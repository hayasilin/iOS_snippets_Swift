//
//  MapViewController.swift
//  AllInOne
//
//  Created by Kuan-Wei Lin on 12/23/17.
//  Copyright © 2017 cracktheterm. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isTranslucent = false
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        navigationItem.title = "Map";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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