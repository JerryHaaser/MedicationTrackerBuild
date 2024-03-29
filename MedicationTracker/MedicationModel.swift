//
//  MedicationModel.swift
//  MedicationTracker
//
//  Created by admin on 9/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

struct Medication: Codable, Equatable {
    var name: String
    var dosage: String
    var specialInstructions: String
    var takeTime: Date?
    var image: Data
    
    init(name: String, dosage: String, specialInstructions: String, takeTime: Date?, image: UIImage) {
        self.name = name
        self.dosage = dosage
        self.specialInstructions = specialInstructions
        self.takeTime = takeTime
        self.image = image.pngData()!
    }
}

