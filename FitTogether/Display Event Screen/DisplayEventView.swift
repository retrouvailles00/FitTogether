//
//  DisplayEventView.swift
//  FitTogether
//
//  Created by retrouvailles on 11/28/23.
//

import UIKit

class DisplayEventView: UIView {
    
    var labelDisplay: UILabel!
    var tableViewActivities: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpLabelDisplay()
        setUpTableViewActivities()
        initConstraints()
    }
    
    func setUpLabelDisplay() {
        labelDisplay = UILabel()
        labelDisplay.text = "Your activities include: "
        labelDisplay.font = UIFont.boldSystemFont(ofSize: 30)
        labelDisplay.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDisplay)
    }
    
    func setUpTableViewActivities(){
        tableViewActivities = UITableView()
        tableViewActivities.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewActivitiesId)
        tableViewActivities.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewActivities)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelDisplay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            labelDisplay.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            tableViewActivities.topAnchor.constraint(equalTo: labelDisplay.bottomAnchor, constant: 8),
            tableViewActivities.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewActivities.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewActivities.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
