//
//  Bar.swift
//  BarsUnleashed
//
//  Created by Bogdan Vitoc on 4/16/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit
import QuartzCore

internal class Bar: UIView {

    /// Color for the completed portion of the bar
    var completedColor = UIColor.orangeColor().CGColor {
        didSet {
            foregroundLayer?.backgroundColor = completedColor
        }
    }
    
    /// Color for the uncompleted portion of the bar
    var uncompletedColor = UIColor.grayColor().CGColor {
        didSet {
            backgroundLayer?.backgroundColor = uncompletedColor
        }
    }
    
    /// Ratio of the bar that is filled (0.0 to 1.0)
    private var value: CGFloat = 0.0
    
    /// Layer for the foreground (filled portion) of a bar
    private var foregroundLayer: CALayer!
    
    /// Layer for the background (unfilled portion) of a bar
    private var backgroundLayer: CALayer!
    
    /// Private tracking for animation
    private var _animated = true
    
    
    // MARK: - Constants
    private let _intrinsicHeight: CGFloat = 16.0
    private let _damping: CGFloat = 10
    private let _borderWidth: CGFloat = 1
    private let _borderColor = UIColor.lightGrayColor().CGColor
    private let _backgroundHeightRatio: CGFloat = 0.85
    
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(super.intrinsicContentSize().width, _intrinsicHeight)
    }
    
    override func layoutSubviews() {
        if foregroundLayer == nil {
            foregroundLayer = CALayer()
            foregroundLayer.backgroundColor = completedColor
            foregroundLayer.anchorPoint = CGPointMake(0, 0)
            foregroundLayer.bounds = foregroundLayerBounds(layer.bounds, widthRatio: 0.0)
            foregroundLayer.cornerRadius = foregroundLayer.bounds.size.height / 2.0
            
            backgroundLayer = CALayer()
            backgroundLayer.backgroundColor = uncompletedColor
            backgroundLayer.borderWidth = _borderWidth
            backgroundLayer.borderColor = _borderColor
            backgroundLayer.anchorPoint = CGPointMake(0, 0)
            backgroundLayer.frame = backgroundLayerBounds(layer.bounds)
            backgroundLayer.cornerRadius = backgroundLayer.bounds.size.height / 2.0

            layer.addSublayer(backgroundLayer)
            layer.addSublayer(foregroundLayer)
        }
        
        updateForegroundLayerWidth()
        backgroundLayer.frame = backgroundLayerBounds(layer.bounds)
        super.layoutSubviews()
    }
    
    private func foregroundLayerBounds(fromBounds: CGRect, widthRatio: CGFloat) -> CGRect {
        return CGRectMake(0, 0, fromBounds.size.width * widthRatio, fromBounds.size.height)
    }
    
    private func backgroundLayerBounds(fromBounds: CGRect) -> CGRect {
        let height = fromBounds.size.height * _backgroundHeightRatio
        let y = (fromBounds.size.height - height) / 2.0
        return CGRectMake(0, y, fromBounds.size.width, height)
    }
    
    private func updateForegroundLayerWidth() {
        
        let width = (backgroundLayer.bounds.size.width * value)
        print(width)
        
        if _animated {
            let widthAnimation = CASpringAnimation(keyPath: "bounds.size.width")
            widthAnimation.damping = _damping
            widthAnimation.duration = widthAnimation.settlingDuration
            widthAnimation.toValue = width
            widthAnimation.fillMode = kCAFillModeForwards
            widthAnimation.removedOnCompletion = false
            foregroundLayer.addAnimation(widthAnimation, forKey: "Size bar to new ratio")
        } else {
            foregroundLayer.bounds = foregroundLayerBounds(backgroundLayer.bounds, widthRatio: value)
        }
    }
    
    func setValue(value: CGFloat, animated: Bool = true) {
        self.value = value
        _animated = animated
    }


}
