//
//  RestoDetailViewController.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 11/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class RestoDetailViewController: UIViewController {

    var restoName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = restoName
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
