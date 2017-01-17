//
//  SegueProtocol.swift
//  SegueHandler
//
//  Created by Iman Zarrabian on 25/03/16.
//  Copyright © 2016 One More Thing Studio. All rights reserved.
//

import Foundation
import UIKit

protocol SegueHandler {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(_ segueIdentifier: SegueIdentifier,
                                    sender: AnyObject?) {
        
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(_ segue: UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                fatalError("Error on segue identifier \(segue.identifier).")
        }
        
        return segueIdentifier
    }
}
