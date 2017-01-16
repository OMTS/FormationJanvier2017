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
import AlamofireImage
import Alamofire

class RestosListViewController: UIViewController {

    @IBOutlet weak var restoTV: UITableView!
    @IBOutlet weak var activityView: UIView!

    var ref: FIRDatabaseReference!

    var arrayOfRestos: [Resto]? {
        didSet {
            if let _ = arrayOfRestos {
                self.activityView.isHidden = true
                self.restoTV.isHidden = false
            }
            else {
                self.activityView.isHidden = false
                self.restoTV.isHidden = true
            }
        }
    }
    
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
            self.updateUI(dict: restosDict)

        })


    let _ = ref.observe(.childChanged, with: { (snapshot) -> Void in

            guard let restosDict = snapshot.value as? [String: AnyObject] else {
                return
            }
            self.updateUI(dict: restosDict)
        })
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       // ref.removeAllObservers()
    }

    func updateUI(dict: [String: AnyObject]) {

        arrayOfRestos = dict.map { (key, value) -> (Resto) in
            let resto = Resto()
            resto.fillObject(id:key, dict: value as! [String : AnyObject])
            return resto
        }

        self.restoTV.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "restoDetailSegue",
            let destVC = segue.destination as? RestoDetailViewController,
            let array = arrayOfRestos {

            let indexPath = restoTV.indexPath(for: sender as! RestoCell)
            destVC.resto = array[indexPath!.row]
        }
    }
}

extension RestosListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let array = arrayOfRestos else {
            return 0
        }
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let array = arrayOfRestos else {
            return UITableViewCell()
        }

        let tvCell = tableView.dequeueReusableCell(withIdentifier: "restoCell", for: indexPath) as! RestoCell

        let resto = array[indexPath.row]

        tvCell.nameLabel.text = resto.name
        tvCell.descriptionLabel.text = resto.desc

        if let url = URL(string: resto.pictUrl) {
            tvCell.restoIV.af_setImage(withURL: url, placeholderImage: UIImage(named: "restoPlaceholder"))
        } else {
            tvCell.restoIV.image = UIImage(named: "restoPlaceholder")
        }

        return tvCell
    }
}

extension RestosListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

