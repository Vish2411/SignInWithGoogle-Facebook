//
//  CollectionViewCell3.swift
//  pageControllerAppDemo
//
//  Created by iMac on 04/08/22.
//

import UIKit

class CollectionViewCell3: UICollectionViewCell {

    
    @IBOutlet weak var specDishImage: UIImageView!
    @IBOutlet weak var speDishName: UILabel!
    @IBOutlet weak var speBurnCal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSpecialDishes(_ SpecDish:ModelSpeDish){
        specDishImage.image = SpecDish.speImage
        speDishName.text = SpecDish.speName
        speBurnCal.text = SpecDish.speCalaries
    }

}
