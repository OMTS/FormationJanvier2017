//
//  Resto.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 11/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import Foundation


struct Resto {
    var name: String
    var description: String
    var pictUrl: String
    
    
    init(dict: [String: AnyObject]) {
        name = dict["name"] as? String ?? ""
        description = dict["description"] as? String ?? ""
        pictUrl = dict["pict_url"] as? String ?? ""
    }
}
