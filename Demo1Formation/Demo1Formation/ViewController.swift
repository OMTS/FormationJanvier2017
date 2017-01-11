//
//  ViewController.swift
//  Demo1Formation
//
//  Created by Iman Zarrabian on 09/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var colorChangingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redButtonPressed(nil)
    }

    
    @IBAction func redButtonPressed(_ sender: UIButton?) {
        nameTF.text = "Test réussit"
        let array = [UIColor.red, UIColor.green, UIColor.black, UIColor.cyan]
        let index = arc4random() % 4
        
        colorChangingView.backgroundColor = array[Int(index)]
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        nameTF.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

