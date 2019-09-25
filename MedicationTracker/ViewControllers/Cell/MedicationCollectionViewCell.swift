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
        
        guard case medication.image = medication.image else { return }
        
        guard case medication.takeTime = medication.takeTime else { return }
        
        medicationNameLabel.text = medication.name
        
        let uiImage: UIImage = UIImage(data: medication.image)!
        medicationImageView.image = uiImage
        
        //medicationImageView.image = medication.image
        timeToTakeLabel.text = "\(String(describing: medication.takeTime))"
//        if medication.takeTime == medication.takeTime {
//            timeToTakeLabel.text = medication.takeTime
//        } else { return }
//        timeToTakeLabel.text = "Take at \(medication.takeTime ?? <#default value#>)"
    }
    
}
