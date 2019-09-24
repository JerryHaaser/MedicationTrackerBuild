//
//  MedicationCollectionViewCell.swift
//  MedicationTracker
//
//  Created by admin on 9/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MedicationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var medicationNameLabel: UILabel!
    @IBOutlet weak var medicationImageView: UIImageView!
    @IBOutlet weak var timeToTakeLabel: UILabel!
    
    var medication: Medication? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let medication = medication else { return }
        
        guard case medication.image = UIImage() else { return }
        
        medicationNameLabel.text = medication.name
        medicationImageView.image = medication.image
        timeToTakeLabel.text = "Take at \(medication.takeTime)"
    }
    
}
