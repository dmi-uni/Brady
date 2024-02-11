//
//  Constants.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import SwiftUI

typealias Leaf = (CGFloat, CGFloat, UUID, Double)

final class Constants {
    
    static let designedDeviceWidth: CGFloat = 162
    static let designedDeviceHeight: CGFloat = 197
    static let animationStep = 1.2
    
    static func getDotPositionByLevel(name: SessionActivityType) -> [Leaf] {
        
        switch name {
            
        case .easy:
            return [
                (25.adaptedWidth(), 20.adaptedHeight(), UUID(), 0),
                (62.adaptedWidth(), 14.adaptedHeight(), UUID(), 0),
                (99.adaptedWidth(), 25.adaptedHeight(), UUID(), 0),
                (130.adaptedWidth(), 13.adaptedHeight(), UUID(), 0),
                (146.adaptedWidth(), 43.adaptedHeight(), UUID(), 0),
                (35.adaptedWidth(), 46.adaptedHeight(), UUID(), 0),
                (71.adaptedWidth(), 43.adaptedHeight(), UUID(), 0),
                (116.adaptedWidth(), 59.adaptedHeight(), UUID(), 0),
                (139.adaptedWidth(), 82.adaptedHeight(), UUID(), 0),
                (20.adaptedWidth(), 68.adaptedHeight(), UUID(), 0),
                (36.adaptedWidth(), 94.adaptedHeight(), UUID(), 0),
                (17.adaptedWidth(), 113.adaptedHeight(), UUID(), 0),
                (17.adaptedWidth(), 150.adaptedHeight(), UUID(), 0),
                (47.adaptedWidth(), 135.adaptedHeight(), UUID(), 0),
                (79.adaptedWidth(), 116.adaptedHeight(), UUID(), 0),
                (90.adaptedWidth(), 142.adaptedHeight(), UUID(), 0),
                (128.adaptedWidth(), 149.adaptedHeight(), UUID(), 0),
                (140.adaptedWidth(), 125.adaptedHeight(), UUID(), 0),
                (122.adaptedWidth(), 102.adaptedHeight(), UUID(), 0)
            ]
            
        case .medium:
            return [
                (22.adaptedWidth(), 15.adaptedHeight(), UUID(), 0),
                (55.adaptedWidth(), 10.adaptedHeight(), UUID(), 0),
                (106.adaptedWidth(), 12.adaptedHeight(), UUID(), 0),
                (145.adaptedWidth(), 15.adaptedHeight(), UUID(), 0),
                (26.adaptedWidth(), 38.adaptedHeight(), UUID(), 0),
                (63.adaptedWidth(), 30.adaptedHeight(), UUID(), 0),
                (100.adaptedWidth(), 28.adaptedHeight(), UUID(), 0),
                (138.adaptedWidth(), 34.adaptedHeight(), UUID(), 0),
                (22.adaptedWidth(), 59.adaptedHeight(), UUID(), 0),
                (57.adaptedWidth(), 50.adaptedHeight(), UUID(), 0),
                (106.adaptedWidth(), 49.adaptedHeight(), UUID(), 0),
                (140.adaptedWidth(), 59.adaptedHeight(), UUID(), 0),
                (38.adaptedWidth(), 83.adaptedHeight(), UUID(), 0),
                (125.adaptedWidth(), 77.adaptedHeight(), UUID(), 0),
                (146.adaptedWidth(), 99.adaptedHeight(), UUID(), 0),
                (25.adaptedWidth(), 100.adaptedHeight(), UUID(), 0),
                (60.adaptedWidth(), 103.adaptedHeight(), UUID(), 0),
                (96.adaptedWidth(), 113.adaptedHeight(), UUID(), 0),
                (128.adaptedWidth(), 112.adaptedHeight(), UUID(), 0),
                (25.adaptedWidth(), 125.adaptedHeight(), UUID(), 0),
                (65.adaptedWidth(), 124.adaptedHeight(), UUID(), 0),
                (100.adaptedWidth(), 133.adaptedHeight(), UUID(), 0),
                (145.adaptedWidth(), 135.adaptedHeight(), UUID(), 0),
                (40.adaptedWidth(), 150.adaptedHeight(), UUID(), 0),
                (80.adaptedWidth(), 148.adaptedHeight(), UUID(), 0),
                (125.adaptedWidth(), 153.adaptedHeight(), UUID(), 0)
            ]
            
        case .high:
            return [
                
                (14.adaptedWidth(), 15.adaptedHeight(), UUID(), 0),
                (40.adaptedWidth(), 9.adaptedHeight(), UUID(), 0),
                (77.adaptedWidth(), 10.adaptedHeight(), UUID(), 0),
                (113.adaptedWidth(), 14.adaptedHeight(), UUID(), 0),
                (145.adaptedWidth(), 15.adaptedHeight(), UUID(), 0),
                (20.adaptedWidth(), 35.adaptedHeight(), UUID(), 0),
                (50.adaptedWidth(), 30.adaptedHeight(), UUID(), 0),
                (80.adaptedWidth(), 28.adaptedHeight(), UUID(), 0),
                (115.adaptedWidth(), 33.adaptedHeight(), UUID(), 0),
                (147.adaptedWidth(), 34.adaptedHeight(), UUID(), 0),
                (14.adaptedWidth(), 55.adaptedHeight(), UUID(), 0),
                (57.adaptedWidth(), 50.adaptedHeight(), UUID(), 0),
                (106.adaptedWidth(), 50.adaptedHeight(), UUID(), 0),
                (140.adaptedWidth(), 49.adaptedHeight(), UUID(), 0),
                (38.adaptedWidth(), 73.adaptedHeight(), UUID(), 0),
                (118.adaptedWidth(), 77.adaptedHeight(), UUID(), 0),
                (144.adaptedWidth(), 70.adaptedHeight(), UUID(), 0),
                (140.adaptedWidth(), 94.adaptedHeight(), UUID(), 0),
                (14.adaptedWidth(), 83.adaptedHeight(), UUID(), 0),
                (19.adaptedWidth(), 103.adaptedHeight(), UUID(), 0),
                (46.adaptedWidth(), 93.adaptedHeight(), UUID(), 0),
                (80.adaptedWidth(), 111.adaptedHeight(), UUID(), 0),
                (112.adaptedWidth(), 102.adaptedHeight(), UUID(), 0),
                (145.adaptedWidth(), 112.adaptedHeight(), UUID(), 0),
                (14.adaptedWidth(), 125.adaptedHeight(), UUID(), 0),
                (47.adaptedWidth(), 116.adaptedHeight(), UUID(), 0),
                (87.adaptedWidth(), 129.adaptedHeight(), UUID(), 0),
                (116.adaptedWidth(), 120.adaptedHeight(), UUID(), 0),
                (145.adaptedWidth(), 135.adaptedHeight(), UUID(), 0),
                (20.adaptedWidth(), 144.adaptedHeight(), UUID(), 0),
                (48.adaptedWidth(), 135.adaptedHeight(), UUID(), 0),
                (82.adaptedWidth(), 148.adaptedHeight(), UUID(), 0),
                (122.adaptedWidth(), 143.adaptedHeight(), UUID(), 0)
            ]
            
        case .pro:
            return  [
                (13.adaptedWidth(), 20.adaptedHeight(), UUID(), 0),
                (35.adaptedWidth(), 14.adaptedHeight(), UUID(), 0),
                (60.adaptedWidth(), 24.adaptedHeight(), UUID(), 0),
                (85.adaptedWidth(), 13.adaptedHeight(), UUID(), 0),
                (115.adaptedWidth(), 15.adaptedHeight(), UUID(), 0),
                (145.adaptedWidth(), 12.adaptedHeight(), UUID(), 0),
                (12.adaptedWidth(), 45.adaptedHeight(), UUID(), 0),
                (13.adaptedWidth(), 68.adaptedHeight(), UUID(), 0),
                (34.adaptedWidth(), 35.adaptedHeight(), UUID(), 0),
                (32.adaptedWidth(), 55.adaptedHeight(), UUID(), 0),
                (56.adaptedWidth(), 46.adaptedHeight(), UUID(), 0),
                (78.adaptedWidth(), 40.adaptedHeight(), UUID(), 0),
                (100.adaptedWidth(), 32.adaptedHeight(), UUID(), 0),
                (125.adaptedWidth(), 37.adaptedHeight(), UUID(), 0),
                (149.adaptedWidth(), 35.adaptedHeight(), UUID(), 0),
                (98.adaptedWidth(), 52.adaptedHeight(), UUID(), 0),
                (123.adaptedWidth(), 55.adaptedHeight(), UUID(), 0),
                (148.adaptedWidth(), 57.adaptedHeight(), UUID(), 0),
                (119.adaptedWidth(), 75.adaptedHeight(), UUID(), 0),
                (143.adaptedWidth(), 78.adaptedHeight(), UUID(), 0),
                (123.adaptedWidth(), 96.adaptedHeight(), UUID(), 0),
                (146.adaptedWidth(), 100.adaptedHeight(), UUID(), 0),
                (104.adaptedWidth(), 109.adaptedHeight(), UUID(), 0),
                (90.adaptedWidth(), 125.adaptedHeight(), UUID(), 0),
                (115.adaptedWidth(), 127.adaptedHeight(), UUID(), 0),
                (140.adaptedWidth(), 119.adaptedHeight(), UUID(), 0),
                (99.adaptedWidth(), 149.adaptedHeight(), UUID(), 0),
                (122.adaptedWidth(), 147.adaptedHeight(), UUID(), 0),
                (142.adaptedWidth(), 137.adaptedHeight(), UUID(), 0),
                (65.adaptedWidth(), 110.adaptedHeight(), UUID(), 0),
                (50.adaptedWidth(), 127.adaptedHeight(), UUID(), 0),
                (25.adaptedWidth(), 129.adaptedHeight(), UUID(), 0),
                (70.adaptedWidth(), 144.adaptedHeight(), UUID(), 0),
                (42.adaptedWidth(), 146.adaptedHeight(), UUID(), 0),
                (15.adaptedWidth(), 148.adaptedHeight(), UUID(), 0),
                (13.adaptedWidth(), 110.adaptedHeight(), UUID(), 0),
                (40.adaptedWidth(), 108.adaptedHeight(), UUID(), 0),
                (17.adaptedWidth(), 90.adaptedHeight(), UUID(), 0),
                (45.adaptedWidth(), 70.adaptedHeight(), UUID(), 0),
                (38.adaptedWidth(), 88.adaptedHeight(), UUID(), 0),
            ]
            
            //        default:
            //            return []
            //
        }
        
    }
    
}
