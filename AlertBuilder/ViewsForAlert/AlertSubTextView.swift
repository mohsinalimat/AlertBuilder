//
//  AlertSubView.swift
//  bkt-smart
//
//  Created by okan.yucel on 15.04.2019.
//  Copyright © 2019 okan.yucel. All rights reserved.
//

import UIKit

class AlertSubTextView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mLabelRight: UILabel!
    @IBOutlet weak var mLabelLeft: UILabel!
    @IBOutlet weak var mViewSeperate: UIView!
    
    init(leftText: String?, rightText: String?) {
        super.init(frame: .zero)
        
        Bundle.main.loadNibNamed("AlertSubTextView", owner: self, options: nil)
        contentView.fixInView(self)

        let left = leftText ?? "nil"
        let right = rightText ?? "nil"
        
        
        self.mLabelLeft.text = left
        self.mLabelRight.text = right
        
        self.mViewSeperate.backgroundColor = .groupTableViewBackground
        
        self.mLabelLeft.font = UIFont.systemFont(ofSize: 14)
        self.mLabelLeft.textColor = .gray
        
        self.mLabelRight.font = UIFont.systemFont(ofSize: 14)
        self.mLabelRight.textColor = .darkText
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private init() {
        super.init(frame: .zero)
        
    }
    
}


