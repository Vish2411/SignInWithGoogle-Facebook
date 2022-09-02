//
//  Model.swift
//  pageControllerAppDemo
//
//  Created by iMac on 02/08/22.
//

import Foundation
import UIKit

internal struct pageModel{
    
    var title:String
    var description:String
    var pageImage:UIImage
}

struct ModelCategoryDish{
    var imageDish:UIImage
    var lblDish:String
}

struct ModelPopDish{
    var popInage:UIImage
    var popName:String
    var popCalaries:String
}

struct ModelSpeDish{
    var speImage:UIImage
    var speName:String
    var speCalaries:String
}

struct ModelDeliveryGuyDetails{
    var deImage:UIImage
    var deName:String
}

enum loginAndSignup {
    case login
    case signUp
}
