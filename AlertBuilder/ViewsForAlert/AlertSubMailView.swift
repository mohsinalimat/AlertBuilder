//
//  AlertSubMailView.swift
//  bkt-smart
//
//  Created by okan.yucel on 22.04.2019.
//  Copyright © 2019 okan.yucel. All rights reserved.
//

import UIKit

class AlertSubMailView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var mViewBack: UIView!
    @IBOutlet weak var mLabelMessage: UILabel!
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mSwitchMail: UISwitch!
    
    init(mailText: String?, image: String) {
        super.init(frame: .zero)
        
        Bundle.main.loadNibNamed("AlertSubMailView", owner: self, options: nil)
        contentView.fixInView(self)
        
        let title = mailText ?? "nil"
        
        self.mImageView.image = UIImage.init(named: image)
        self.mLabelMessage.text = title
        
        self.mLabelMessage.font = UIFont.systemFont(ofSize: 14)
        self.mLabelMessage.textColor = UIColor.darkText
        
        mSwitchMail.onTintColor = .purple
        mSwitchMail.thumbTintColor = .lightGray
        mSwitchMail.tintColor = .lightGray
        mSwitchMail.backgroundColor = .clear
        
        self.mViewBack.backgroundColor = .groupTableViewBackground
        
        
        
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

