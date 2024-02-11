//
//  BradyApp.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import SwiftUI

@main
struct BradyApp: App {
    @StateObject private var stopwatchManager = StopwatchManager(sessionActivityType: SessionActivityType.easy)
    @AppStorage("localOnBoarding") var localOnBoarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if localOnBoarding /*&& !UserDefaults.standard.bool(forKey: "userOnBoarding")*/ {
                    //                    TabView{
                    onBoarding1View()
                    
                    //                        onBoarding2View()
                    //                        onBoarding3View()
                    //                        onBoarding4View()
                    //                        onBoarding5View()
                    //                        onBoarding6View(localOnBoarding: $localOnBoarding)
                    //                    }
                } else {
                    StartView()
                }
            }
            .sheet(isPresented: $stopwatchManager.showingSummaryView) {
                SummaryView()
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("") {  }
                        }
                    })
            }
            .environmentObject(stopwatchManager)
        }
    }
}
