//
//  MealView.swift
//  Brady WatchKit Extension
//
//  Created by Danil Masnaviev on 07/06/22.
//

import SwiftUI

struct MealView: View {
    @EnvironmentObject var stopwatchManager: StopwatchManager
    
    var body: some View {
        TimelineView(.periodic(from: Date(), by: 1.0/120)) { context in
            ZStack {
                if stopwatchManager.open == false {
                    Image("SlothMouthClose")
                        .resizable()
                        .frame(width: 43.adapted(), height: 44.adapted(), alignment: .center)
                        .position(x: WKInterfaceDevice.current().screenBounds.width / 2, y: WKInterfaceDevice.current().screenBounds.height / 2.55)
                } else {
                    Image("SlothMouthOpen")
                        .resizable()
                        .frame(width: 43.adapted(), height: 44.adapted(), alignment: .center)
                        .position(x: WKInterfaceDevice.current().screenBounds.width / 2, y: WKInterfaceDevice.current().screenBounds.height / 2.55)
                }
                
                ForEach(stopwatchManager.mealViewModel.dotsPosition, id:\.2) { position in
                    Image((stopwatchManager.selectedSession ?? .easy).image)
                        .resizable()
                        .frame(width: (stopwatchManager.selectedSession ?? .easy).width.adapted(), height: (stopwatchManager.selectedSession ?? .easy).height.adapted())
                        .position(x: position.0, y: position.1)
                        .opacity(position.3)
                        .animation(.easeInOut(duration: 1), value: position.3)
                }
                
                
            }
        }
    }
}
