//
//  CollectionViewCell2.swift
//  pageControllerAppDemo
//
//  Created by iMac on 03/08/22.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {

    
    @IBOutlet weak var popDishImage: UIImageView!
    @IBOutlet weak var popDishName: UILabel!
    @IBOutlet weak var popCalaries: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setPopularDish(_ popDish:ModelPopDish){
        popDishImage.image = popDish.popInage
        popDishName.text = popDish.popName
        popCalaries.text = popDish.popCalaries
    }
}
