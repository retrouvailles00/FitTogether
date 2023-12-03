//
//  ActivitiesTableViewCell.swift
//  FitTogether
//
//  Created by retrouvailles on 12/3/23.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelQuantity: UILabel!
    var imageActivity: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpWrapperCellView()
        setUpLabelQuantity()
        setUpImageActivity()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpWrapperCellView() {
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
    
    func setUpLabelQuantity(){
        labelQuantity = UILabel()
        labelQuantity.font = UIFont.boldSystemFont(ofSize: 40)
        labelQuantity.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelQuantity)
    }
    
    func setUpImageActivity() {
        imageActivity = UIImageView()
        imageActivity.contentMode = .scaleToFill
        imageActivity.clipsToBounds = true
        imageActivity.layer.cornerRadius = 10
        imageActivity.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageActivity)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            imageActivity.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageActivity.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            imageActivity.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            imageActivity.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            
            labelQuantity.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            labelQuantity.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -20),
            labelQuantity.heightAnchor.constraint(equalToConstant: 32),
            labelQuantity.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 104)
            
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
