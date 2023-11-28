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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let chatViewController = ChatViewController()
//        chatViewController.currentUser = currentUser
//        chatViewController.currentReceiver = usersList[indexPath.row]
//        navigationController?.pushViewController(chatViewController, animated: true)
//    }
}
