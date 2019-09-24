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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        
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
