//
//  FourthViewController.swift
//  DemoTwo
//
//  Created by Iman Zarrabian on 10/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    var name = "toto"
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fourth")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        dismiss(animated: true) { 
            print("dismissed " + self.name)
        }
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
