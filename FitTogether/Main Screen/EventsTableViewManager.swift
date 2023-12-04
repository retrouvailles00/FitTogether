//
//  EventsTableViewManager.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewEventsId, for: indexPath) as! EventsTableViewCell
        cell.labelIntake.text =  "Intake: "  + String(eventsList[indexPath.row].intake)
        cell.labelConsume.text =  "Consume " + String(eventsList[indexPath.row].consume)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayEventViewController = DisplayEventViewController()
        displayEventViewController.currentUser = self.currentUser
        var activities = [Activity]()
        
        if (eventsList[indexPath.row].fruit != 0) {
            activities.append(Activity(type: "fruit", quantity: eventsList[indexPath.row].fruit))
        }
        if (eventsList[indexPath.row].vegetable != 0) {
            activities.append(Activity(type: "vegetable", quantity: eventsList[indexPath.row].vegetable))
        }
        if (eventsList[indexPath.row].protein != 0) {
            activities.append(Activity(type: "protein", quantity: eventsList[indexPath.row].protein))
        }
        if (eventsList[indexPath.row].gym != 0) {
            activities.append(Activity(type: "gym", quantity: eventsList[indexPath.row].gym))
        }
        if (eventsList[indexPath.row].bike != 0) {
            activities.append(Activity(type: "bike", quantity: eventsList[indexPath.row].bike))
        }
       
        displayEventViewController.activitiesList = activities
        navigationController?.pushViewController(displayEventViewController, animated: true)
    }
}
