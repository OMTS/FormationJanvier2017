//
//  ThirdViewController.swift
//  DemoTwo
//
//  Created by Iman Zarrabian on 10/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var receivingLabel: UILabel!
    var receivingText: String?
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let text = receivingText {
            receivingLabel.text = text
        }
        
        
        if let childVC = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") {
            
            addChildViewController(childVC)
            containerView.addSubview(childVC.view)
        }
        
        
        
        print("view did load third")
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
