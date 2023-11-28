//
//  EventsTableViewCell.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelIntake: UILabel!
    var labelConsume: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpWrapperCellView()
        setUpLabelIntake()
        setUpLabelConsume()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setUpLabelIntake(){
        labelIntake = UILabel()
        labelIntake.font = UIFont.boldSystemFont(ofSize: 20)
        labelIntake.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelIntake)
    }
    
    func setUpLabelConsume() {
        labelConsume = UILabel()
        labelConsume.font = UIFont.boldSystemFont(ofSize: 20)
        labelConsume.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelConsume)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelIntake.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelIntake.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelIntake.heightAnchor.constraint(equalToConstant: 20),
            labelIntake.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelConsume.topAnchor.constraint(equalTo: labelIntake.bottomAnchor, constant: 8),
            labelConsume.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelConsume.heightAnchor.constraint(equalToConstant: 20),
            labelConsume.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
