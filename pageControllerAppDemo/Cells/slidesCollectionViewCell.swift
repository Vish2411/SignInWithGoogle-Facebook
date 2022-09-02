//
//  slidesCollectionViewCell.swift
//  pageControllerAppDemo
//
//  Created by iMac on 02/08/22.
//

import UIKit

class slidesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideimage: UIImageView!
    @IBOutlet weak var sliderDescription: UILabel!
    @IBOutlet weak var sliderTitle: UILabel!
    
    func slideSetUp(_ slide : pageModel){
        slideimage.image = slide.pageImage
        sliderTitle.text = slide.title
        sliderDescription.text = slide.description
    }
}
