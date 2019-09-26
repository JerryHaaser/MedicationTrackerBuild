//
//  EditMedicationViewController.swift
//  MedicationTracker
//
//  Created by admin on 9/26/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import UserNotifications

class EditMedicationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var medicationNameEditTextField: UITextField!
    @IBOutlet weak var dosageEditTextField: UITextField!
    @IBOutlet weak var sIEditTextField: UITextField!
    @IBOutlet weak var medicationEditImageView: UIImageView!
    @IBOutlet weak var editTakeTImePicker: UIDatePicker!
    

    var medication: Medication?
    
    var medicationController: MedicationController?
    
    var medicationCell: MedicationCollectionViewCell?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
    func setViews() {
        
    }
    
    @IBAction func uploadPhotoButton(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Please select your source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Camera Unavailable", message: "We were unable to access your camera", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        medicationEditImageView.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
//    func dateComponents(_ components: Set<Calendar.Component>, from date: Date) -> DateComponents {
//        
//        
//    }
    
//    func setAlarm(medication: Medication?) {
//        guard let medication = medication else { return }
//        let alarmTime = medication.takeTime
//
//        var calendar = Calendar(identifier: .gregorian)
//        var dateComponents = DateComponents()
//        dateComponents.hour =
//
//
//        let aT = calendar.date(from: dateComponents)
//
//        let content = UNMutableNotificationContent()
//        content.title = "Time for your medicine"
//        content.body = "It's time to take \(medication.name)"
//        content.sound = UNNotificationSound.default
//
//        //let trigger = UNCalendarNotificationTrigger(dateMatching: alarmTime, repeats: true)
//
//        let triggerDaily = Calendar.current.dateComponents(alarmTime, from: Date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
//
//
//
//    }
    
    @IBAction func saveEditButton(_ sender: UIButton) {
        
        guard let medication = medication else { return }
        
        
        
        medicationController?.deleteMedication(medication: medication)
        
        guard let name = medicationNameEditTextField.text,
            let dosage = dosageEditTextField.text,
            let specialInstructions = sIEditTextField.text,
            let takeTime = editTakeTImePicker?.date,
            let image = medicationEditImageView.image else { return }
        
        
        medicationController?.addMedication(name: name, dosage: dosage, specialInstructions: specialInstructions, takeTime: takeTime, image: image)
        
        self.navigationController!.popToRootViewController(animated: true)
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
