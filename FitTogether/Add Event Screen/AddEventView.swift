//
//  AddEventView.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import UIKit

class AddEventView: UIView {
    
    var labelIntake: UILabel!
    var labelConsume: UILabel!
    
    var buttonIntakeSelectType: UIButton!
    var textFieldIntake: UITextField!
    
    var buttonConsumeSelectType: UIButton!
    var textFieldConsume: UITextField!
    
    var buttonAdd: UIButton!
    var buttonSubmit: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpLabelIntake()
        setUpLabelConsume()
        
        setUpIntakeButtonSelectType()
        setUpTextFieldIntake()
        
        setUpConsumeButtonSelectType()
        setUpTextFieldConsume()
        
        setUpButtonAdd()
        setUpButtonSubmit()
        initConstraints()
    }
    
    func setUpLabelIntake() {
        labelIntake = UILabel()
        labelIntake.font = UIFont.boldSystemFont(ofSize: 30)
        labelIntake.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelIntake)
    }
    
    func setUpLabelConsume() {
        labelConsume = UILabel()
        labelConsume.font = UIFont.boldSystemFont(ofSize: 30)
        labelConsume.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelConsume)
    }
    
    func setUpIntakeButtonSelectType() {
        buttonIntakeSelectType = UIButton(type: .system)
        buttonIntakeSelectType.setTitle("Select the type of Intake:", for: .normal)
        buttonIntakeSelectType.showsMenuAsPrimaryAction = true
        buttonIntakeSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonIntakeSelectType)
    }
    
    func setUpTextFieldIntake() {
        textFieldIntake = UITextField()
        textFieldIntake.placeholder = "Quantity"
        textFieldIntake.borderStyle = .roundedRect
        textFieldIntake.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldIntake)
    }
    
    func setUpConsumeButtonSelectType() {
        buttonConsumeSelectType = UIButton(type: .system)
        buttonConsumeSelectType.setTitle("Select the type of Consume:", for: .normal)
        buttonConsumeSelectType.showsMenuAsPrimaryAction = true
        buttonConsumeSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonConsumeSelectType)
    }
    
    func setUpTextFieldConsume() {
        textFieldConsume = UITextField()
        textFieldConsume.placeholder = "Quantity"
        textFieldConsume.borderStyle = .roundedRect
        textFieldConsume.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldConsume)
    }
    
    func setUpButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Add", for: .normal)
        buttonAdd.setImage(.add, for: .normal)
        buttonAdd.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    func setUpButtonSubmit() {
        buttonSubmit = UIButton(type: .system)
        buttonSubmit.setTitle("Submit", for: .normal)
        buttonSubmit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmit)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelIntake.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            labelIntake.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            labelConsume.topAnchor.constraint(equalTo: labelIntake.bottomAnchor, constant: 16),
            labelConsume.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            buttonIntakeSelectType.topAnchor.constraint(equalTo: labelConsume.bottomAnchor, constant: 16),
            buttonIntakeSelectType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldIntake.topAnchor.constraint(equalTo: buttonIntakeSelectType.bottomAnchor, constant: 8),
            textFieldIntake.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldIntake.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonConsumeSelectType.topAnchor.constraint(equalTo: textFieldIntake.bottomAnchor, constant: 16),
            buttonConsumeSelectType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldConsume.topAnchor.constraint(equalTo: buttonConsumeSelectType.bottomAnchor, constant: 8),
            textFieldConsume.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldConsume.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            buttonAdd.topAnchor.constraint(equalTo: textFieldConsume.bottomAnchor, constant: 8),
            buttonAdd.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAdd.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonSubmit.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 8),
            buttonSubmit.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonSubmit.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
