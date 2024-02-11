//
//  ViewUtilities.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import SwiftUI

extension CGFloat {
    //arithmetic mean for width and height ratios
    func adapted() -> CGFloat {
        return CGFloat.minimum(self.adaptedHeight(), self.adaptedWidth())
    }
    
    //width ratio
    func adaptedWidth() -> CGFloat {
        return CGFloat(self) * WKInterfaceDevice.current().screenBounds.width / Constants.designedDeviceWidth
    }
    
    //height ratio
    func adaptedHeight() -> CGFloat {
        return CGFloat(self) * WKInterfaceDevice.current().screenBounds.height / Constants.designedDeviceHeight
    }
}

extension Int {
    func adapted() -> CGFloat {
        return CGFloat(self).adapted()
    }
    
    func adaptedWidth() -> CGFloat {
        return CGFloat(self).adaptedWidth()
    }
    
    func adaptedHeight() -> CGFloat {
        return CGFloat(self).adaptedHeight()
    }
}

extension TimeInterval {
    var hourMinuteSecondMS: String {
        String(format:"%d:%02d:%02d.%03d", hour, minute, second, millisecond)
    }
    var minuteSecondMS: String {
        String(format:"%02d:%02d.%02d", minute, second, millisecond)
    }
    var minuteFormat: String {
        String(format:"%02d.%02d", minute, second)
    }
    
    var hour: Int {
        Int((self/3600).truncatingRemainder(dividingBy: 3600))
    }
    var minute: Int {
        Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        Int((self*100).truncatingRemainder(dividingBy: 100))
    }
}

