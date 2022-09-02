//
//  CollectionViewCell1PSVC.swift
//  pageControllerAppDemo
//
//  Created by iMac on 08/08/22.
//

import UIKit

class CollectionViewCell1PSVC: UICollectionViewCell {

    
    @IBOutlet weak var imageDeliveryGuy: UIImageView!
    @IBOutlet weak var lblDeliveryGuyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupDeliveryGuy(_ guy:ModelDeliveryGuyDetails){
        imageDeliveryGuy.image = guy.deImage
        lblDeliveryGuyName.text = guy.deName
    }

}
