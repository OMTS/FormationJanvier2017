//
//  Resto.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 11/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import Foundation
import RealmSwift

class Resto: Object {
    dynamic var name: String = ""
    dynamic var desc: String = ""
    dynamic var pictUrl: String = ""
    dynamic var id: String = ""
    dynamic var lat: Double = 0.0
    dynamic var lng: Double = 0.0


    override static func primaryKey() -> String? {
        return "id"
    }

    func fillObject(id: String, dict: [String: AnyObject]) {
        self.id = id
        name = dict["name"] as? String ?? ""
        desc = dict["description"] as? String ?? ""
        pictUrl = dict["pict_url"] as? String ?? ""
        lat = dict["lat"] as? Double ?? 0.0
        lng = dict["lng"] as? Double ?? 0.0
    }
 }
