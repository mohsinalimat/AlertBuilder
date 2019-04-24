//
//  AlertSubMessageView.swift
//  bkt-smart
//
//  Created by okan.yucel on 16.04.2019.
//  Copyright © 2019 okan.yucel. All rights reserved.
//

import UIKit

class AlertSubMessageView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mLabelMessage: UILabel!
    
    init(messageText: String?) {
        super.init(frame: .zero)
        
        Bundle.main.loadNibNamed("AlertSubMessageView", owner: self, options: nil)
        contentView.fixInView(self)
        
        let title = messageText ?? "nil"
        
        
        self.mLabelMessage.text = title
        
        self.mLabelMessage.font = UIFont.systemFont(ofSize: 14)
        self.mLabelMessage.textColor = UIColor.darkText
        
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

