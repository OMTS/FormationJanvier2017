//
//  ViewController.swift
//  SegueHandler
//
//  Created by Iman Zarrabian on 02/02/16.
//  Copyright © 2016 One More Thing Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SegueHandler {


    enum SegueIdentifier: String {
        case FirstViewControllerSegue
        case SecondViewControllerSegue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        performSegueWithIdentifier(.FirstViewControllerSegue, sender: nil)
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        performSegueWithIdentifier(.SecondViewControllerSegue, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /**** FIRST ATTEMPT ****/
        
//        if let identifier = segue.identifier {
//            if let segueId = SegueIdentifier(rawValue: identifier) {
//                switch segueId {
//                case .FirstViewControllerSegue:
//                    print("First")
//                case .SecondViewControllerSegue:
//                    print("Second")
//                }
//            }
//        }

        /**** SECOND ATTEMPT ****/

      
//        guard let identifier = segue.identifier,
//            segueId = SegueIdentifier(rawValue: identifier) else {
//                fatalError("Error on segue identifier \(segue.identifier).")
//        }
//        
        
//        switch segueId {
//            case .FirstViewControllerSegue:
//                print("First")
//            case .SecondViewControllerSegue:
//                print("Second")
//        }
        
        
        /**** FINAL ATTEMPT ****/
        
        switch segueIdentifierForSegue(segue) {
        case .FirstViewControllerSegue:
            print("First")
        case .SecondViewControllerSegue:
            print("Second")
        }
        
    }

}





