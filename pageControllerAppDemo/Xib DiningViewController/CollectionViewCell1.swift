//
//  CollectionViewCell1.swift
//  pageControllerAppDemo
//
//  Created by iMac on 03/08/22.
//

import UIKit

class CollectionViewCell1: UICollectionViewCell {

    
    @IBOutlet weak var imageDish: UIImageView!
    @IBOutlet weak var lblDish: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupDishes(_ dish:ModelCategoryDish){
        imageDish.image = dish.imageDish
        lblDish.text = dish.lblDish
    }
}
