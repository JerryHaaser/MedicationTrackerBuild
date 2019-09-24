//
//  AddMedicationViewController.swift
//  MedicationTracker
//
//  Created by admin on 9/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AddMedicationViewController: UIViewController {

    @IBOutlet weak var medicationNameTextField: UITextField!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var specialInstructionsTextField: UITextField!
    @IBOutlet weak var addMedicationImageView: UIImageView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var medication: Medication?
    
    var medicationController: MedicationController?
    
    var medicationCell: MedicationCollectionViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
