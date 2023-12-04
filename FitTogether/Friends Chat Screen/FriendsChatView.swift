//
//  FriendsChatView.swift
//  FitTogether
//
//  Created by retrouvailles on 12/3/23.
//

import UIKit

class FriendsChatView: UIView {

    var labelText: UILabel!
    var tableViewFriends: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpLabelText()
        setUpTableViewFriends()
        initConstraints()
    }
    
    func setUpLabelText(){
        labelText = UILabel()
        labelText.text = "hello"
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setUpTableViewFriends() {
        tableViewFriends = UITableView()
        tableViewFriends.register(FriendsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewFriendsId)
        tableViewFriends.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewFriends)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            labelText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8),
            
            tableViewFriends.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 8),
            tableViewFriends.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewFriends.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewFriends.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
    }
    
}
