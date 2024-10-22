//
//  ViewController.swift
//  alertPickerMiniApp
//
//  Created by Dominik Penkava on 10/21/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DateListUpdater {

    @IBOutlet weak var tableViewThing: UITableView!
    
    public let dataHolder = tableViewDataHolder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let dataVC = DataViewController()
//        dataVC.deligater = self
        
//        print("called")
        
        guard let tableView = tableViewThing else {
            print("TableView is nil")
            return
        }
        
        dataHolder.addDate(time: "123", date: "test")
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHolder.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath)
        let timeData = dataHolder.data[indexPath.row]
        cell.textLabel?.text = "\(timeData.time) - \(timeData.date)"

        return cell
    }
    
    func updateList(time: String, date: String) {
        print("updating data... \(time), \(date)")
        dataHolder.addDate(time: time, date: date)
        tableViewThing.reloadData()
    }
    
}
