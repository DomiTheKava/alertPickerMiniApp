//
//  customTabBarVC.swift
//  alertPickerMiniApp
//
//  Created by Dominik Penkava on 10/21/24.
//

import Foundation
import SwiftUI

class customTabBarVC: UITabBarController {
    
    @IBInspectable var initialLocation: Int = 0
    
    override func viewDidLoad() {
        selectedIndex = initialLocation
    }
    
}
