//
//  MedicationController.swift
//  MedicationTracker
//
//  Created by admin on 9/24/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class MedicationController {
    
    var medications: [Medication] = []
    
    func addMedication(name: String, dosage: String, takeTime: TakeTime, image: UIImage) {
        let medication = Medication(name: name, dosage: dosage, takeTime: takeTime, image: image)
        medications.append(medication)
    }
    
   // func update(medication: Medication, )
}