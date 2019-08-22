//
//  CalendarTimeTableViewCell.swift
//  West Deerfield Township
//
//  Created by Ben Rosen on 1/13/19.
//  Copyright © 2019 Ben Rosen. All rights reserved.
//

import UIKit

class CalendarTimeTableViewCell: UITableViewCell {

    static let reuseIdentifier = "CalendarTimeTableViewCell"
    
    let container = UIView()
    let timeImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        selectionStyle = .none
        
        container.backgroundColor = UIColor.white
        container.layer.masksToBounds = true
        container.layer.cornerRadius = 8
        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(container)
        
        contentView.addConstraints([
            container.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        timeImageView.image = UIImage(named: "clock")?.withRenderingMode(.alwaysTemplate)
        timeImageView.tintColor = UIColor(red: 0.188, green: 0.404, blue: 0.592, alpha: 1.00)
        timeImageView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(timeImageView)
        
        timeImageView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 15).isActive = true
        timeImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        timeImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        timeImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        titleLabel.textColor = UIColor.black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(titleLabel)
        
        titleLabel.leftAnchor.constraint(equalTo: timeImageView.rightAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 8).isActive = true

        
        subtitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(subtitleLabel)
        
        
        subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8).isActive = true

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
