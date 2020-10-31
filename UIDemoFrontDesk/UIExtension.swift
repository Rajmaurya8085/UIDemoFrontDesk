//
//  UIExtension.swift
//  UIDemoFrontDesk
//
//  Created by Raj Maurya on 30/10/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var borderColor:UIColor{
        set{
            self.layer.borderColor = (newValue as UIColor).cgColor
        }
        get{
            let color  = self.layer.borderColor
            return UIColor(cgColor: color!)
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        set{
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
    func setShadowOnView(_ color: CGColor) {
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 2.0
        self.clipsToBounds = true
    }
    
}
