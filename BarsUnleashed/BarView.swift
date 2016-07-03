//
//  BarView.swift
//  BarsUnleashed
//
//  Created by Bogdan Vitoc on 4/16/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit

public class BarView: CommonInitStackView {
    
    private var data = [BarEntry]()
    private var views = [BarEntryView]()
    private let _spacing: CGFloat = 10.0
    private let _requiredRatioEmpty = 0.2
    
    override func commonInit() {
        axis = .Vertical
        spacing = _spacing
        distribution = .EqualSpacing
    }
    
    /// Color for the uncompleted portion of the bar
    public var uncompletedColor = UIColor.darkGrayColor() { didSet { updateLabelStyles() } }
    
    /// Color for the border of the uncompleted portion of the bar
    public var borderColor = UIColor.lightGrayColor() { didSet { updateLabelStyles() } }
    
    /// Text color
    public var textColor = UIColor.whiteColor() { didSet { updateLabelStyles() } }

    /// Name label font
    public var nameFont = UIFont.systemFontOfSize(UIFont.labelFontSize()) { didSet { updateLabelStyles() } }
    
    /// Value label font
    public var valueFont = UIFont.systemFontOfSize(UIFont.labelFontSize()) { didSet { updateLabelStyles() } }
    
    /**
     Set the data for the bar graph
     
     - parameter data:      an array of bar entries
     - parameter animated:  animates the bars on load and bounds change
     */
    public func setData(data: [BarEntry], animated: Bool = true) {
        views.forEach { $0.removeFromSuperview() }
        views.removeAll()
        
        for entry in data {
            let view = BarEntryView()
            view.headerView.title = entry.name
            view.headerView.value = entry.value
            views.append(view)
            addArrangedSubview(view)
        }
        
        // [(BarEntryView, BarEntry)]
        let viewsAndEntries = Array(Zip2Sequence(views, data))
        let maxBound = CGFloat(getMaxBound(data))
        print("maxBound: \(maxBound)")
        for tuple in Array(viewsAndEntries) {
            tuple.0.bar.setValue((CGFloat(tuple.1.value)/maxBound), animated: animated)
            tuple.0.bar.completedColor = tuple.1.color.CGColor
            tuple.0.bar.uncompletedColor = uncompletedColor.CGColor
        }
        
        updateLabelStyles()
    }
    
    private func getMaxBound(data:[BarEntry]) -> Int {
        let max = data.map { $0.value ?? 0 }.maxElement() ?? 0
        print(max)
        let multiplier = (1.0 + _requiredRatioEmpty)
        return Int(ceil(Double(max) * multiplier))
    }
    
    private func updateLabelStyles() {
        for view in views {
            view.headerView.titleLabel.textColor = textColor
            view.headerView.titleLabel.font = nameFont
            view.headerView.valueLabel.textColor = textColor
            view.headerView.valueLabel.font = valueFont
            view.bar.uncompletedColor = uncompletedColor.CGColor
            view.bar.borderColor = borderColor.CGColor
        }
    }

}
