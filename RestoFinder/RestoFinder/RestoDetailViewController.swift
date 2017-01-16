//
//  RestoDetailViewController.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 11/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit
import Alamofire
import MapKit
import RealmSwift

class RestoDetailViewController: UIViewController {

    var resto: Resto?
    //var savedResto: Resto?
    
    @IBOutlet weak var modalNavbarItem: UINavigationItem!
    @IBOutlet weak var modalNavbar: UINavigationBar!
    @IBOutlet weak var mapTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var favButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let unResto = resto {
            modalNavbar.isHidden = true
            mapTopConstraint.constant = -64.0
            
            //We have a resto filled in so it's a detail VC
            title = unResto.name
            mapView.delegate = self

            //changer l'etat du bouton en fonction de s'il est en base
            changeFavButtonState()

        }
        else {
            modalNavbar.delegate = self
            //This is a resto creation
            modalNavbarItem.title = "Créer un nouveau resto"
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if let _ = resto {
            setAnnotationOnMap()
        }
    }

    func setRegionOnMap() {
        let center = CLLocationCoordinate2D(latitude: resto!.lat, longitude: resto!.lng)
        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }

    func setAnnotationOnMap() {
        let annotation = RestoAnnotation(resto: resto!)
        mapView.addAnnotation(annotation)
    }



    func sendMyApiRequest() {
        if let id = resto?.id {
            let action = Router.getRestoDetail(id)

            request(action).responseJSON { (json) in
                if let data = json.result.value as? [String: AnyObject] {
                    self.resto = Resto()
                    self.resto?.fillObject(id: id, dict: data)
                    self.title = self.resto?.name
                    print(self.resto!.lat)
                    print(self.resto!.lng)

                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func callAPI(_ sender: UIButton) {
        sendMyApiRequest()
    }


    @IBAction func dismissVC(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addToFavs(_ sender: UIButton) {
        let realm = try! Realm()

        if resto?.realm != nil {
            //remove
            try! realm.write {
                realm.delete(resto!)
                //reupdate current resto propertie
                favButton.isSelected = false
            }

        }
        else {
            try! realm.write {
                //Might crash the app if we try to add an invalidated object
                realm.add(resto!, update: true)
                favButton.isSelected = true
            }
        }

        let pathToRealm = Realm.Configuration.defaultConfiguration.fileURL
        print(pathToRealm!)
    }

    func changeFavButtonState() {
        let realm = try! Realm()

        //update buttons state
        resto = realm.object(ofType: Resto.self, forPrimaryKey: resto!.id) ?? resto
        favButton.isSelected = resto?.realm != nil
    }

    /*
    @IBAction func addToFavs(_ sender: UIButton) {
        let realm = try! Realm()

        if savedResto != nil {
            //remove
            try! realm.write {
                realm.delete(savedResto!)
                //reupdate current resto propertie
                savedResto = nil
                favButton.isSelected = false
            }

        }
        else {
            try! realm.write {
                //Might crash the app if we try to add an invalidated object
                if savedResto == nil {
                    savedResto = Resto(value: resto!)
                }
                realm.add(savedResto!, update: true)
                favButton.isSelected = true
            }
        }

        let pathToRealm = Realm.Configuration.defaultConfiguration.fileURL
        print(pathToRealm!)
    }

    func changeFavButtonState() {
        let realm = try! Realm()

        //update buttons state
        savedResto = realm.object(ofType: Resto.self, forPrimaryKey: resto!.id)
        favButton.isSelected = savedResto != nil
    }
    */
 }

extension RestoDetailViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}


extension RestoDetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return nil
    }

    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        setRegionOnMap()
    }
}
