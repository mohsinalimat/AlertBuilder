//
//  RoundedShadowStackView.swift
//  AlertBuilder
//
//  Created by Okan Yücel on 23.04.2019.
//  Copyright © 2019 Okan Yücel. All rights reserved.
//

import UIKit

class RoundedShadowStackView: UIStackView {
    
    var shadowLayer:CAShapeLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutView()
    }
    
    override func awakeFromNib() {
        layoutView()
    }
    
    override var bounds: CGRect {
        didSet {
            layoutView()
        }
    }
    
    func layoutView(shadowColor: UIColor = UIColor.black,
                    fillColor: UIColor = UIColor.white,
                    opacity: Float = 0.2,
                    offset: CGSize = CGSize(width: 0.0, height: 1.0),
                    viewRadius: CGFloat = 5,
                    shadowRadius: CGFloat = 3){
        
        
        if let layer1 = self.layer.sublayers?[0] as? CAShapeLayer{
            layer1.removeFromSuperlayer()
        }
        
        
        shadowLayer = CAShapeLayer()
        
        shadowLayer!.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: viewRadius).cgPath
        shadowLayer!.fillColor = fillColor.cgColor
        shadowLayer!.shadowColor = shadowColor.cgColor
        shadowLayer!.shadowPath = shadowLayer!.path
        shadowLayer!.shadowOffset = offset
        shadowLayer!.shadowOpacity = opacity
        shadowLayer!.shadowRadius = shadowRadius
        shadowLayer!.frame = self.bounds
        layer.insertSublayer(shadowLayer!, at: 0)
        //print(shadowLayer!.bounds.size.width)
        
        
    }
}


