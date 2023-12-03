//
//  ActivitiesTableViewManager.swift
//  FitTogether
//
//  Created by retrouvailles on 12/3/23.
//

import Foundation
import UIKit

extension DisplayEventViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewActivitiesId, for: indexPath) as! ActivitiesTableViewCell
        switch activitiesList[indexPath.row].type {
            case "fruit":
                cell.imageActivity.image = UIImage(named: "lemon.png")
                break
            case "vegetable":
                cell.imageActivity.image = UIImage(named: "broccoli.png")
                break
            case "protein":
                cell.imageActivity.image = UIImage(named: "cut_of_meat.png")
                break
            case "gym":
                cell.imageActivity.image = UIImage(named: "martial_arts_uniform.png")
                break
            case "bike":
                cell.imageActivity.image = UIImage(named: "man-biking.png")
                break
            case "hike":
                cell.imageActivity.image = UIImage(named: "runner.png")
                break
            default:
                break
        }
        
        cell.labelQuantity.text =  String(activitiesList[indexPath.row].quantity)
        return cell
    }
}
