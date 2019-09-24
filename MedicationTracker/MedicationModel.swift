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
    var takeTime: TakeTime
    var image: UIImage?
    
    init(name: String, dosage: String, takeTime: TakeTime, image: UIImage) {
        self.name = name
        self.dosage = dosage
        self.takeTime = takeTime
        self.image = image
    }
}

struct TakeTime {
    
}
