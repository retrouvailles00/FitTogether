//
//  AddEventView.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import UIKit

class AddEventView: UIView {
    
    var textFieldIntake: UITextField!
    var textFieldConsume: UITextField!
    var buttonAdd: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpTextFieldIntake()
        setUpTextFieldConsume()
        setupButtonAdd()
        
        initConstraints()
    }
    
    func setUpTextFieldIntake() {
        textFieldIntake = UITextField()
        textFieldIntake.placeholder = "Intake"
        textFieldIntake.borderStyle = .roundedRect
        textFieldIntake.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldIntake)
    }
    
    func setUpTextFieldConsume() {
        textFieldConsume = UITextField()
        textFieldConsume.placeholder = "Consume"
        textFieldConsume.borderStyle = .roundedRect
        textFieldConsume.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldConsume)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Add", for: .normal)
        buttonAdd.setImage(.add, for: .normal)
        buttonAdd.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldIntake.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            textFieldIntake.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldIntake.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldConsume.topAnchor.constraint(equalTo: textFieldIntake.bottomAnchor, constant: 8),
            textFieldConsume.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldConsume.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonAdd.topAnchor.constraint(equalTo: textFieldConsume.bottomAnchor, constant: 8),
            buttonAdd.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAdd.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
