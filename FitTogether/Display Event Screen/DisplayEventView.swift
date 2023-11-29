//
//  DisplayEventView.swift
//  FitTogether
//
//  Created by retrouvailles on 11/28/23.
//

import UIKit

class DisplayEventView: UIView {
    
    var labelDisplay: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpLabelDisplay()
        initConstraints()
    }
    
    func setUpLabelDisplay() {
        labelDisplay = UILabel()
        labelDisplay.font = UIFont.boldSystemFont(ofSize: 30)
        labelDisplay.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDisplay)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelDisplay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            labelDisplay.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
