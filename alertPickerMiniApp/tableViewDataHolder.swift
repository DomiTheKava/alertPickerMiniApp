//
//  tableViewDataHolder.swift
//  alertPickerMiniApp
//
//  Created by Dominik Penkava on 10/21/24.
//

import Foundation
import SwiftUI

class tableViewDataHolder {
    
    var dataDisplayViewController: ViewController?
    
    var data: [TimeData] = []
    
    func addDate(time: String, date: String) {
        let newTD = TimeData(time: time, date: date)
        data.append(newTD)
    }
    
    
}

class TimeData {
    var time: String
    var date: String
    
    init(time: String, date: String) {
        self.time = time
        self.date = date
    }
}
