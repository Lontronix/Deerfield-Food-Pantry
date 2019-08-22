//
//  HeaderTableViewCell.swift
//  West Deerfield Township
//
//  Created by Ben Rosen on 1/13/19.
//  Copyright © 2019 Ben Rosen. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    static let reuseIdentifier = "HeaderTableViewCell"
    
    let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        selectionStyle = .none
        
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(label)
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
