//
//  UIView+Extenions.swift
//  AlertBuilder
//
//  Created by Okan Yücel on 23.04.2019.
//  Copyright © 2019 Okan Yücel. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    func roundCorners(_ corners:UIRectCorner,_ cormerMask:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *){
            self.clipsToBounds = false
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cormerMask
        }else{
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.mask = rectShape
        }
    }
    
}
