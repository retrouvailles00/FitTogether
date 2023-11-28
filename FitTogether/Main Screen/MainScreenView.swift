//
//  MainScreenView.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import UIKit


class MainScreenView: UIView {

    var profilePic: UIImageView!
    var labelText: UILabel!
    var floatingButtonAddEvent: UIButton!
    var tableViewEvents: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupProfilePic()
        setupLabelText()
        setupFloatingButtonAddEvent()
        setupTableViewEvents()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupProfilePic(){
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupTableViewEvents(){
        tableViewEvents = UITableView()
        tableViewEvents.register(EventsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewEventsId)
        tableViewEvents.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewEvents)
    }
    
    func setupFloatingButtonAddEvent(){
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
            
            tableViewEvents.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 8),
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

