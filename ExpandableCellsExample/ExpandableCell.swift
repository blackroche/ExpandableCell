//
//  ExpandableCell.swift
//  ExpandableCellsExample
//
//  Created by DC on 28.08.2016.
//  Copyright © 2016 Dawid Cedrych. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    //@IBOutlet weak var collectionView: UICollectionView!
  
    @IBOutlet weak var collecvtionView: UICollectionView!

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var collectionViewCellHeightC: NSLayoutConstraint!
    @IBOutlet weak var imgHeightConstraint: NSLayoutConstraint!
    
    let imgs = ["0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2"]
    let categories = ["Hamburgers", "Saver Menu", "Sides", "Desserts", "Drinks", "Offers", "Specials", "Wraps", "Chicken", "Meals"]
    
    var menuItems = [String]()

    var categoryItems = [String]()
    var isExpanded:Bool = false
        {
        didSet
        {
            if !isExpanded {
                self.collectionViewCellHeightC.constant = 0.0
                
            } else {
                
            print(categoryItems)
               
                let itemCount = Double(menuItems.count)
                let rounder = ceil(itemCount / 2)
                print(rounder)
                self.collectionViewCellHeightC.constant = CGFloat(145 * rounder)
            }
        }
    }
    
    override func awakeFromNib() {
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
    
    }
    

}

//extension ExpandableCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    }
