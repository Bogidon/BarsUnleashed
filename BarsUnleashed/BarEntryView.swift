//
//  BarCell.swift
//  BarsUnleashed
//
//  Created by Bogdan Vitoc on 4/16/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit

internal class BarEntryView: CommonInitStackView {
    
    let headerView = BarEntryHeaderView()
    let bar = Bar()
    
    override func commonInit() {
        axis = .Vertical
        distribution = .EqualSpacing
        addArrangedSubview(headerView)
        addArrangedSubview(bar)
    }
}
