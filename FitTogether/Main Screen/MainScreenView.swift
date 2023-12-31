//
//  MainScreenView.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import UIKit


class MainScreenView: UIView {

    var profilePic: UIImageView!
    var friendsChatButton: UIButton!
    var nearbyButton: UIButton!
    var labelText: UILabel!
    var labelTotal: UILabel!
    var floatingButtonAddEvent: UIButton!
    var tableViewEvents: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpProfilePic()
        setUpFriendsChatButton()
        setUpNearbyButton()
        setUpLabelText()
        setUpLabelTotal()
        setUpFloatingButtonAddEvent()
        setUpTableViewEvents()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setUpProfilePic(){
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setUpFriendsChatButton() {
        friendsChatButton = UIButton(type: .system)
        friendsChatButton.setTitle("", for: .normal)
        friendsChatButton.setImage(UIImage(systemName: "person.3.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        friendsChatButton.contentHorizontalAlignment = .fill
        friendsChatButton.contentVerticalAlignment = .fill
        friendsChatButton.imageView?.contentMode = .scaleAspectFit
        friendsChatButton.layer.cornerRadius = 16
        friendsChatButton.imageView?.layer.shadowOffset = .zero
        friendsChatButton.imageView?.layer.shadowRadius = 0.8
        friendsChatButton.imageView?.layer.shadowOpacity = 0.7
        friendsChatButton.imageView?.clipsToBounds = true
        friendsChatButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(friendsChatButton)
    }
    
    func setUpNearbyButton() {
        nearbyButton = UIButton(type: .system)
        nearbyButton.setTitle("", for: .normal)
        nearbyButton.setImage(UIImage(systemName: "map.circle")?.withRenderingMode(.alwaysOriginal), for: .normal)
        nearbyButton.contentHorizontalAlignment = .fill
        nearbyButton.contentVerticalAlignment = .fill
        nearbyButton.imageView?.contentMode = .scaleAspectFit
        nearbyButton.layer.cornerRadius = 16
        nearbyButton.imageView?.layer.shadowOffset = .zero
        nearbyButton.imageView?.layer.shadowRadius = 0.8
        nearbyButton.imageView?.layer.shadowOpacity = 0.7
        nearbyButton.imageView?.clipsToBounds = true
        nearbyButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nearbyButton)
    }
    
    func setUpLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setUpLabelTotal(){
        labelTotal = UILabel()
        labelTotal.font = .boldSystemFont(ofSize: 14)
        labelTotal.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTotal)
    }
    
    func setUpTableViewEvents(){
        tableViewEvents = UITableView()
        tableViewEvents.register(EventsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewEventsId)
        tableViewEvents.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewEvents)
    }
    
    func setUpFloatingButtonAddEvent(){
        floatingButtonAddEvent = UIButton(type: .system)
        floatingButtonAddEvent.setTitle("", for: .normal)
        floatingButtonAddEvent.setImage(UIImage(systemName: "person.crop.circle.fill.badge.plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButtonAddEvent.contentHorizontalAlignment = .fill
        floatingButtonAddEvent.contentVerticalAlignment = .fill
        floatingButtonAddEvent.imageView?.contentMode = .scaleAspectFit
        floatingButtonAddEvent.layer.cornerRadius = 16
        floatingButtonAddEvent.imageView?.layer.shadowOffset = .zero
        floatingButtonAddEvent.imageView?.layer.shadowRadius = 0.8
        floatingButtonAddEvent.imageView?.layer.shadowOpacity = 0.7
        floatingButtonAddEvent.imageView?.clipsToBounds = true
        floatingButtonAddEvent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonAddEvent)
    }
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 32),
            profilePic.heightAnchor.constraint(equalToConstant: 32),
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            labelText.topAnchor.constraint(equalTo: profilePic.topAnchor),
            labelText.bottomAnchor.constraint(equalTo: profilePic.bottomAnchor),
            labelText.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 8),
            
            friendsChatButton.widthAnchor.constraint(equalToConstant: 32),
            friendsChatButton.heightAnchor.constraint(equalToConstant: 32),
            friendsChatButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            friendsChatButton.trailingAnchor.constraint(equalTo: nearbyButton.leadingAnchor, constant: -20),
            
            nearbyButton.widthAnchor.constraint(equalToConstant: 32),
            nearbyButton.heightAnchor.constraint(equalToConstant: 32),
            nearbyButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            nearbyButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            labelTotal.topAnchor.constraint(equalTo: profilePic.bottomAnchor),
            labelTotal.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor),
            labelTotal.heightAnchor.constraint(equalToConstant: 60),
            
            tableViewEvents.topAnchor.constraint(equalTo: labelTotal.bottomAnchor, constant: 8),
            tableViewEvents.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewEvents.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewEvents.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            floatingButtonAddEvent.widthAnchor.constraint(equalToConstant: 48),
            floatingButtonAddEvent.heightAnchor.constraint(equalToConstant: 48),
            floatingButtonAddEvent.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonAddEvent.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

