//
//  BarEntryHeaderView.swift
//  BarsUnleashed
//
//  Created by Bogdan Vitoc on 4/16/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit

internal class BarEntryHeaderView: CommonInitStackView {

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var value: Int? {
        didSet {
            valueLabel.text = "\(value!)"
        }
    }
    
    override func commonInit() {
        configureLabels()
        layout()
    }
    
    private func configureLabels() {
        titleLabel.textAlignment = .Left
        valueLabel.textAlignment = .Right
    }
    
    private func layout() {
        axis = .Horizontal
        addArrangedSubview(titleLabel)
        addArrangedSubview(valueLabel)
    }

}
