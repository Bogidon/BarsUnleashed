//
//  BarEntry.swift
//  BarsUnleashed
//
//  Created by Bogdan Vitoc on 4/16/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit

public struct BarEntry {
    var value: Int
    var name: String
    var color: UIColor
    
    public init (value: Int, name: String, color: UIColor) {
        self.value = value
        self.name = name
        self.color = color
    }
}