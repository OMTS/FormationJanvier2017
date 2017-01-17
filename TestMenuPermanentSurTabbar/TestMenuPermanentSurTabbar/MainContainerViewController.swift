//
//  MainContainerViewController.swift
//  TestMenuPermanentSurTabbar
//
//  Created by Iman Zarrabian on 17/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class MainContainerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var trailingMenuContraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(handleMenuMessage), name: NSNotification.Name(rawValue: "menuButtonPressed"), object: nil)


    /*    let tabbarVC = storyboard?.instantiateViewController(withIdentifier: "tabbarVC")
        addChildViewController(tabbarVC!)
        view.addSubview(tabbarVC!.view)
*/

       // view.bringSubview(toFront: menuView)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleMenuMessage() {

        self.trailingMenuContraint.constant = self.trailingMenuContraint.constant == 0.0 ? -240.0 : 0.0

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5.0, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
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
