//
//  AlertSubTitleView.swift
//  bkt-smart
//
//  Created by okan.yucel on 16.04.2019.
//  Copyright © 2019 okan.yucel. All rights reserved.
//

import UIKit

class AlertSubTitleView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mLabelTitle: UILabel!
    
    init(titleText: String?) {
        super.init(frame: .zero)
        
        Bundle.main.loadNibNamed("AlertSubTitleView", owner: self, options: nil)
        contentView.fixInView(self)
        
        let title = titleText ?? "nil"
        
        
        self.mLabelTitle.text = title
        
        self.mLabelTitle.font = UIFont.systemFont(ofSize: 22)
        self.mLabelTitle.textColor = .darkText
        
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
