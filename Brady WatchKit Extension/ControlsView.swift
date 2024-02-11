//
//  ControlsView.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject var stopwatchManager: StopwatchManager
    
    var body: some View {
        VStack(alignment: .center) {
            
            VStack {
                Button {
                    stopwatchManager.togglePause()
                } label: {
                    Image(systemName: stopwatchManager.running ? "pause" : "arrow.clockwise")
                        .imageScale(.large)
                }
                .frame(width: 77.adaptedWidth(), height: 40.adaptedHeight())
                .tint(.yellow)
//                .font(.title2)
                Text(stopwatchManager.running ? "Pause" : "Resume")
                    .font(.system(size: 16.adapted()))
                    .fontWeight(.regular)
                    .padding(.top, -6.adapted())
            }
            .padding(.top, 14)
            
            
            Spacer()
            Spacer()
            Spacer()
            
            VStack {
                Button {
                    stopwatchManager.endSession(showSummary: true)
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        
                }
                .frame(width: 77.adaptedWidth(), height: 40.adaptedHeight())
                .tint(.red)
//                .font(.title2)
                Text("End")
                    .font(.system(size: 16.adapted()))
                    .fontWeight(.regular)
                    .padding(.top, -6.adapted())
            }
            .padding(.bottom, 2)
            
        }
        .frame(width: 100.adaptedWidth())
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView().environmentObject(StopwatchManager(sessionActivityType: SessionActivityType.easy))
    }
}
