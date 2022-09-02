//
//  Extension.swift
//  pageControllerAppDemo
//
//  Created by iMa/Users/imac/Desktop/Vishal Rami/pageControllerAppDemo/pageControllerAppDemo/Cellsc on 02/08/22.


import UIKit

extension UIView{
    @IBInspectable var cornerRadius:CGFloat{
        get{ return cornerRadius }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

