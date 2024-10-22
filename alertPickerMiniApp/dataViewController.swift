//
//  dataViewController.swift
//  alertPickerMiniApp
//
//  Created by Dominik Penkava on 10/21/24.
//

import Foundation
import SwiftUI

class DataViewController: ViewController {
    
    private var selectedDate: Date?
    private var selectedTime: Date?
    
    var deligate: DateListUpdater?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabBarVC = self.tabBarController,
           let firstVC = tabBarVC.viewControllers?[0] as? ViewController {
            deligate = firstVC // Set the delegate to the existing ViewController instance
        }
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        // value changed do somethin
        
        selectedDate = sender.date
        selectedTime = sender.date
        
    }
    
    @IBAction func addDateBtn(_ sender: Any) {
        
        // TODO: make alert to tell user its been successfuly added (or not)
        
        let alert = UIAlertController(title: "Successfully added", message: "", preferredStyle: .alert)
        let okAlertBtn = UIAlertAction(title: "ok", style: .default, handler: { _ in
            // nothin
            self.dismiss(animated: true)
        })
        alert.addAction(okAlertBtn)
        
        
        guard let selectedDate else {
            print("failed")
            alert.title = "Failed to add. Try changing the date."
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        self.present(alert, animated: true, completion: nil)
    
        
        // format
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .full
        let dateString = dateFormatter.string(from: selectedDate)
        print(dateString)
        
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: selectedDate)
        print(timeString)

        // show and pass data onto home view *works*
//        if let tableViewVC = tabBarController?.viewControllers?[0] as? ViewController {
//            tableViewVC.dataHolder.addDate(time: timeString, date: dateString)
//            tableViewVC.tableViewThing.reloadData()
//        }

        // update the list and pass the data back
        deligate?.updateList(time: timeString, date: dateString)

        
    }
    
}
