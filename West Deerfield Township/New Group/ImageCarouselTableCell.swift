//
//  ImageCarouselTableViewCell.swift
//  Food Pantry
//
//  Created by Lonnie Gerol on 1/21/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class ImageCarouselTableCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
   
    var timer = Timer()
    var visibleImageIndex = -1
   
 
    var images = [UIImage(named: "FP1"), UIImage(named: "FP2"), UIImage(named: "FP3"), UIImage(named: "FP4"), UIImage(named: "FP5"), UIImage(named: "FP6"), UIImage(named: "FP7"), UIImage(named: "FP8"), UIImage(named: "FP9") ]

    var collectionView: UICollectionView!
    var containerView: UIView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "default")
        self.backgroundColor = UIColor.clear
        
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 8
        collectionView.isUserInteractionEnabled = false
        collectionView.isUserInteractionEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        
        contentView.addConstraints([
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        containerView.addSubview(collectionView)
        containerView.addConstraints([
            collectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
            ])
        
       collectionView.setContentHuggingPriority(.init(1000), for: .vertical)
        
        collectionView.setContentCompressionResistancePriority(.init(1000.0), for: .vertical)
        imageView?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    override func layoutSubviews() {
       super.layoutSubviews()
        
        
        collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: "imageCell")
        
        
     
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.scroll), userInfo: nil, repeats: true)
        
        
        let shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 7)
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.05)
        containerView.layer.shadowOpacity = 0.10
        containerView.layer.shadowPath = shadowPath.cgPath

    }

    
    @objc func scroll(){
        
        if(visibleImageIndex == 8){
            visibleImageIndex = 0
            collectionView.scrollToItem(at: IndexPath(row: visibleImageIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
        else{
            visibleImageIndex = visibleImageIndex + 1
            collectionView.scrollToItem(at: IndexPath(row: visibleImageIndex, section: 0), at: .centeredHorizontally, animated: true)
            
        }
        
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionCell
        
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.width, height: self.contentView.frame.height)
    }
    
    
}
