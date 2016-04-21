//
//  UIStackView+CommonInit.swift
//  BarsUnleashed
//
//  Created by Bogdan Vitoc on 4/18/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import Foundation

public class CommonInitStackView: UIStackView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override public init(arrangedSubviews views: [UIView]) {
        super.init(arrangedSubviews: views)
        commonInit()
    }
    
    convenience public init() {
        self.init(arrangedSubviews: [])
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    internal func commonInit() {}
}