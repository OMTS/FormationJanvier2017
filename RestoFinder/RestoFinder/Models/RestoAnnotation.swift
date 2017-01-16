//
//  RestoAnnotation.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 16/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit
import MapKit

class RestoAnnotation: NSObject {
    var resto: Resto!

    init(resto: Resto) {
        self.resto = resto
    }

}
extension RestoAnnotation: MKAnnotation {

    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: resto.lat, longitude: resto.lng)
        }
    }

    var title: String? {
        get {
            return resto.name
        }
    }

    var subtitle: String? {
        get {
            return resto.desc
        }
    }
}
