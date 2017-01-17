//
//  FirstViewController.swift
//  TestMenuPermanentSurTabbar
//
//  Created by Iman Zarrabian on 17/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let ud = UserDefaults.standard

        if let myValue = ud.object(forKey: "reponseUniverselle") {
            print(myValue as! Int)
        }
        else {
            UserDefaults.standard.set(42, forKey: "reponseUniverselle")
            UserDefaults.standard.synchronize()
        }

        exampleOfDispatchoperations()


    }

    func exampleOfDispatchoperations() {
        let qos = DispatchQoS(qosClass: .background, relativePriority: 0)
        let queue = DispatchQueue(label: "com.mon.imagepreocessingque", qos: qos, attributes: .concurrent, autoreleaseFrequency: .never)

        queue.async {
            print("top async")
            queue.sync {
                print("again")
            }

            DispatchQueue.main.async {
                print("toto")
            }
        }

        queue.sync {
            print("top sync")
        }

        queue.asyncAfter(wallDeadline: .now() + 3) {
            print("executed after")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: "menuButtonPressed") , object: nil)
    }
}

