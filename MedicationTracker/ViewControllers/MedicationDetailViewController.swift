//
//  MedicationDetailViewController.swift
//  MedicationTracker
//
//  Created by admin on 9/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MedicationDetailViewController: UIViewController {
    
    @IBOutlet weak var medicationNameLabel: UILabel!
    @IBOutlet weak var medicationImageView: UIImageView!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var timeToTakeLabel: UILabel!
    @IBOutlet weak var specialInstructionsTextView: UITextView!
    
    var medicationController: MedicationController?
    
    var medication: Medication?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.timeZone = .autoupdatingCurrent
        return formatter
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
    }

    
    func updateViews() {
        guard let medication = medication else { return }
        
        medicationNameLabel.text = medication.name

        dosageLabel.text = medication.dosage
        
        if medication.takeTime == medication.takeTime {
            timeToTakeLabel.text = dateFormatter.string(from: medication.takeTime!)
        } else { return }
        
        specialInstructionsTextView.text = medication.specialInstructions
        
        let uiImage: UIImage = UIImage(data: medication.image)!
        medicationImageView.image = uiImage
            
        
        
        
    }
    
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        
        guard let medication = medication else { return }
        medicationController?.deleteMedication(medication: medication)
        
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {

    }


}
