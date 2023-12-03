//
//  DisplayEventViewController.swift
//  FitTogether
//
//  Created by retrouvailles on 11/28/23.
//

import UIKit

class DisplayEventViewController: UIViewController {
    
    let displayEventScreen = DisplayEventView()
    
    var activitiesList = [Activity]()
    
    override func loadView() {
        view = displayEventScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayEventScreen.tableViewActivities.delegate = self
        displayEventScreen.tableViewActivities.dataSource = self
        displayEventScreen.tableViewActivities.separatorStyle = .none

        
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
