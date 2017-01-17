//
//  ViewController.swift
//  GestureExamples
//
//  Created by Iman Zarrabian on 17/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionView: UIView!
    @IBOutlet weak var commandCenterView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()


        actionView.layer.cornerRadius = 20.0
        actionView.layer.masksToBounds = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 2
        commandCenterView.addGestureRecognizer(tapGesture)

        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUpGesture.direction = .down
        commandCenterView.addGestureRecognizer(swipeUpGesture)

        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRightGesture.direction = .right
        commandCenterView.addGestureRecognizer(swipeRightGesture)


        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeftGesture.direction = .left
        commandCenterView.addGestureRecognizer(swipeLeftGesture)

       // let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
       // view.addGestureRecognizer(panGesture)
    }

    func handleTap() {
        actionView.backgroundColor = UIColor.red
    }

    func handleSwipe(swipeGesture: UISwipeGestureRecognizer) {
        if swipeGesture.direction == .down {
            UIView.animate(withDuration: 0.2, animations: { 
                self.actionView.center = CGPoint(x: self.actionView.center.x, y: self.actionView.center.y + 100.0)
            })
        } else if swipeGesture.direction == .right {
            UIView.animate(withDuration: 0.2, animations: {
                self.actionView.center = CGPoint(x: self.actionView.center.x + 100, y: self.actionView.center.y)
            })
        } else if swipeGesture.direction == .left {

            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10.0, options: [], animations: {
                self.actionView.center = CGPoint(x: self.actionView.center.x - 100, y: self.actionView.center.y)

            }, completion: nil)
        }
    }

    func handlePan(panGesture: UIPanGestureRecognizer) {

        let pointInView = panGesture.location(in: view)
        let x = pointInView.x
        let y = pointInView.y
        print("x : \(x) AND y : \(y)")
        actionView.center = pointInView
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

