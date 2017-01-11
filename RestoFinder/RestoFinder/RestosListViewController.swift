//
//  ViewController.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 11/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RestosListViewController: UIViewController {

    @IBOutlet weak var restoTV: UITableView!
    var ref: FIRDatabaseReference!

    var arrayOfRestos: [Resto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restoTV.delegate = self
        restoTV.dataSource = self
        
        restoTV.estimatedRowHeight = 108.0
        restoTV.rowHeight = UITableViewAutomaticDimension

        
        ref = FIRDatabase.database().reference()
    
        
        let _ = ref.observe(.childAdded, with: { (snapshot) -> Void in
            
            guard let restosDict = snapshot.value as? [String: AnyObject] else {
                return
            }

            self.arrayOfRestos = Array(restosDict.values).map {
                return Resto(dict: $0 as! [String: AnyObject])
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "restoDetailSegue",
            let destVC = segue.destination as? RestoDetailViewController {
            
            let indexPath = restoTV.indexPath(for: sender as! RestoCell)
            destVC.restoName = arrayOfRestos[indexPath!.row].name
        }
    }
}

extension RestosListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRestos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tvCell = tableView.dequeueReusableCell(withIdentifier: "restoCell", for: indexPath) as! RestoCell
        tvCell.nameLabel.text = arrayOfRestos[indexPath.row].name
        tvCell.descriptionLabel.text = arrayOfRestos[indexPath.row].description
       
        return tvCell
    }
}

extension RestosListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

