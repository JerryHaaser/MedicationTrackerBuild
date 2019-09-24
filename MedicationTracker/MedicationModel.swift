//
//  MedicationModel.swift
//  MedicationTracker
//
//  Created by admin on 9/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

struct Medication {
    var name: String
    var dosage: String
    var specialInstructions: String
    var takeTime: TakeTime
    var image: UIImage?
    
    init(name: String, dosage: String, specialInstructions: String, takeTime: TakeTime, image: UIImage) {
        self.name = name
        self.dosage = dosage
        self.specialInstructions = specialInstructions
        self.takeTime = takeTime
        self.image = image
    }
}

struct TakeTime {
    var time: UIDatePicker
}
