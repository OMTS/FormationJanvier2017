//
//  FirstViewController.swift
//  DemoTwo
//
//  Created by Iman Zarrabian on 10/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view Did Load First View")

        //loadSecondView()
    }
    
   /* func loadSecondView() {
        guard let tabBarC = tabBarController,
            let secondVC = tabBarC.viewControllers?.last as? SecondViewController else {
                return
        }
        
        
    }
 */
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("we are doomed")

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier,
            id == "thirdSegue",
            let destVC = segue.destination as? ThirdViewController {
            destVC.receivingText = mainLabel.text
        }
    }
    
    func handleNotification() {
        print("we are active")
    }

}

