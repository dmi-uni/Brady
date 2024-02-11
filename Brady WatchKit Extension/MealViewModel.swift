//
//  MealViewModel.swift
//  Brady WatchKit Extension
//
//  Created by Danil Masnaviev on 07/06/22.
//

import Foundation
import SwiftUI


class MealViewModel: ObservableObject {
    @EnvironmentObject var stopwatchManager: StopwatchManager
    
    var sessionActivityType: SessionActivityType
    
    @Published var dotsPosition: Array<Leaf>
    
    init(_ sessionActivityType: SessionActivityType) {
        self.sessionActivityType = sessionActivityType
        self._dotsPosition = .init(wrappedValue: Constants.getDotPositionByLevel(name: sessionActivityType))
    }
}

