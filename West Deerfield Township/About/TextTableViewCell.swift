//
//  TextTableViewCell.swift
//  Food Pantry
//
//  Created by Lonnie Gerol on 1/21/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    var headerLabel: UILabel = UILabel()
    var textView: UITextView = UITextView()
    private var containerView: UIView!
    
    

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor(displayP3Red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        textView.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        headerLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        headerLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        headerLabel.textColor = UIColor(displayP3Red: 62/255, green: 100/255, blue: 151/255, alpha: 1.0)
        headerLabel.numberOfLines = 0
        
        containerView = UIView()
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.white
        contentView.addSubview(containerView)
        
        contentView.addConstraints([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(headerLabel)
        containerView.addSubview(textView)
        
        containerView.addConstraints([
            headerLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            headerLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            ])
        
        
        containerView.addConstraints([
            textView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            textView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            ])
        
            containerView.addConstraint(NSLayoutConstraint(item: headerLabel, attribute: .bottom, relatedBy: .equal, toItem: textView, attribute: .top, multiplier: 1, constant: 0))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 7)
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.05)
        containerView.layer.shadowOpacity = 0.10
        containerView.layer.shadowPath = shadowPath.cgPath

        
    }
    
    override func updateConstraints() {
    
      

        super.updateConstraints()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
