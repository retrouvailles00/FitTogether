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
    var buttonShare: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpLabelDisplay()
        setUpTableViewActivities()
        setUpButtonShare()
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
    
    func setUpButtonShare() {
        buttonShare = UIButton(type: .system)
        buttonShare.setTitle("", for: .normal)
        buttonShare.setImage(UIImage(systemName: "person.3.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonShare.contentHorizontalAlignment = .fill
        buttonShare.contentVerticalAlignment = .fill
        buttonShare.imageView?.contentMode = .scaleAspectFit
        buttonShare.layer.cornerRadius = 16
        buttonShare.imageView?.layer.shadowOffset = .zero
        buttonShare.imageView?.layer.shadowRadius = 0.8
        buttonShare.imageView?.layer.shadowOpacity = 0.7
        buttonShare.imageView?.clipsToBounds = true
        buttonShare.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonShare)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            buttonShare.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            buttonShare.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonShare.heightAnchor.constraint(equalToConstant: 40),
            buttonShare.widthAnchor.constraint(equalTo: buttonShare.heightAnchor),
            
            labelDisplay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
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
