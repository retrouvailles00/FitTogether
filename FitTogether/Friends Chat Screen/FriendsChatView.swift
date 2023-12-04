//
//  FriendsChatView.swift
//  FitTogether
//
//  Created by retrouvailles on 12/3/23.
//

import UIKit

class FriendsChatView: UIView {

    var labelText: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpLabelText()
        initConstraints()
    }
    
    func setUpLabelText(){
        labelText = UILabel()
        labelText.text = "hello"
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            labelText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8),
        ])
    }
    
}
