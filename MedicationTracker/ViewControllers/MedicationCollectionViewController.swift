//
//  MedicationCollectionViewController.swift
//  MedicationTracker
//
//  Created by admin on 9/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MedicationCell"

class MedicationCollectionViewController: UICollectionViewController {

    let medicationController = MedicationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMedicationSegue" {
            
            let addMedicationVC = segue.destination as? AddMedicationViewController
            addMedicationVC?.medicationController = medicationController
            
        }; if segue.identifier == "MedicationDetailShowSegue" {
            
            if let medicationDetailVC = segue.destination as? MedicationDetailViewController {
                if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                    medicationDetailVC.medicationController = medicationController
                    medicationDetailVC.medication = medicationController.medications[indexPath.row]
                }
            }
            
        } else if segue.identifier == "EditShowSegue" {
            let medicationEditVC = segue.destination as? EditMedicationViewController
            medicationEditVC?.medicationController = medicationController
        }
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return medicationController.medications.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MedicationCollectionViewCell else { return UICollectionViewCell() }
        
        let aMedication = medicationController.medications[indexPath.item]
        cell.medication = aMedication
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
    
        return cell
    }

}
