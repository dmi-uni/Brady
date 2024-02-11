//
//  SessionActivityView.swift
//  Brady WatchKit Extension
//
//  Created by Danil Masnaviev on 07/06/22.
//

import Foundation
import SwiftUI

enum SessionActivityType: UInt, CaseIterable {
    case easy = 1
    case medium = 2
    case high = 3
    case pro = 4
}

extension SessionActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        case .pro:
            return "Pro"
        }
    }
    
    var image: String {
        switch self {
        case .easy:
            return "GreenLeaf"
        case .medium:
            return "YellowLeaf"
        case .high:
            return "OrangeLeaf"
        case .pro:
            return "RedLeaf"
        }
    }
    
    var interval: Int {
        switch self {
        case .easy:
            return 21
        case .medium:
            return 28
        case .high:
            return 35
        case .pro:
            return 42
        }
    }
    
    var width: Int {
        switch self {
        case .easy:
            return 30
        case .medium:
            return 29
        case .high:
            return 24
        case .pro:
            return 22
        }
    }
    
    var height: Int {
        switch self {
        case .easy:
            return 18
        case .medium:
            return 17
        case .high:
            return 14
        case .pro:
            return 13
        }
    }
    
    var color: String {
        switch self {
        case .easy:
            return "GreenLeaf"
        case .medium:
            return "YellowLeaf"
        case .high:
            return "OrangeLeaf"
        case .pro:
            return "RedLeaf"
        }
    }
    
    
}

