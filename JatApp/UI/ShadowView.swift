//
//  ShadowView.swift
//  JatApp
//
//  Created by Dima Khymych on 18.01.2021.
//

import UIKit

@IBDesignable
class ShadowView: UIView {

   @IBInspectable var shadowColor:UIColor = UIColor.clear {
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius:CGFloat = .zero{
         didSet{
             layer.shadowRadius = shadowRadius
         }
     }
    
    @IBInspectable var shadowOpacity:CGFloat = .zero {
         didSet{
            layer.shadowOpacity = Float(shadowOpacity)
         }
     }
    
    @IBInspectable var shadowOffsetY:CGFloat = .zero {
         didSet{
            layer.shadowOffset.height = shadowOffsetY
         }
     }

}
