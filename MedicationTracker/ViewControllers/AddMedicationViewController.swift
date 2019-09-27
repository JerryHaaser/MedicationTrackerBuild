//
//  AddMedicationViewController.swift
//  MedicationTracker
//
//  Created by admin on 9/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import UserNotifications

class AddMedicationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var medicationNameTextField: UITextField!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var specialInstructionsTextField: UITextField!
    @IBOutlet weak var addMedicationImageView: UIImageView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var medication: Medication?
    
    var medicationController: MedicationController?
    
    var medicationCell: MedicationCollectionViewCell?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        formatter.timeZone = .current
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
        addMedicationImageView.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
//    func dateComponents(_ components: Set<Calendar.Component>, from date: Date) -> DateComponents {
//
//
//    }
    
    func setAlarm(medication: Medication?) {
        guard let medication = medication else { return }
        guard case medication.takeTime = medication.takeTime else { return }
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        
        content.title = "Time to take your medicine"
        content.body = "It's time to take \(medication.name)"
        content.sound = UNNotificationSound.default
        content.threadIdentifier = "local-notification temp"
        
        let date = Date(timeInterval: 0, since: medication.takeTime!)
        
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "content", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print (error as Any)
            }
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        guard let name = medicationNameTextField.text,
              let dosage = dosageTextField.text,
              let specialInstructions = specialInstructionsTextField.text,
              let takeTime = timePicker?.date,
            let image = addMedicationImageView.image else { return }
              
        
        medicationController?.addMedication(name: name, dosage: dosage, specialInstructions: specialInstructions, takeTime: takeTime, image: image)
        setAlarm(medication: medication)
        
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

//func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//    picker.dismiss(animated: true, completion: nil)
//}
//
//func dateComponents(_ components: Set<Calendar.Component>, from date: Date) -> DateComponents {
//
//
//}
//
//func setAlarm(medication: Medication?) {
//    guard let medication = medication else { return }
//    let alarmTime = medication.takeTime
//
//    var calendar = Calendar(identifier: .gregorian)
//    var dateComponents = DateComponents()
//
//
//    let aT = calendar.date(from: dateComponents)
//
//    let content = UNMutableNotificationContent()
//    content.title = "Time for your medicine"
//    content.body = "It's time to take \(medication.name)"
//    content.sound = UNNotificationSound.default
//
//    let trigger = UNCalendarNotificationTrigger(dateMatching: alarmTime, repeats: true)
//
//    let triggerDaily = Calendar.current.dateComponents(alarmTime, from: Date)
//    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
//
//
//
//    let aContent = UNMutableNotificationContent()
//    content.title = NSString.localizedUserNotificationString(forKey: "Time to take your medicine", arguments: nil)
//    content.body = NSString.localizedUserNotificationString(forKey: "It's time to take \(medication.name)",
//        arguments: nil)
//    // Configure the trigger for a 7am wakeup.
//    var dateInfo = DateComponents()
//    dateInfo.hour = 7
//    dateInfo.minute = 0
//    let aTrigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
//    // Create the request object.
//    let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
//
//
//
//}
