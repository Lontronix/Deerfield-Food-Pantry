//
//  ImageCollectionViewCell.swift
//  Food Pantry
//
//  Created by Lonnie Gerol on 1/21/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    var imageView = UIImageView()
   
    

    override func layoutSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        imageView.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        imageView.setContentHuggingPriority(.init(rawValue: 1000), for: .vertical)
        contentView.addConstraints([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            ])
     
    
        
        self.backgroundColor = UIColor.clear
    }
    

}
