//
//  SessionPagingView.swift
//  Brady WatchKit Extension
//
//  Created by Danil Masnaviev on 07/06/22.
//

import SwiftUI

struct SessionPagingView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var stopwatchManager: StopwatchManager
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .metrics
    
    enum Tab {
        case controls, metrics
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ControlsView().tag(Tab.controls)
            MealView().tag(Tab.metrics)
        }
        .navigationTitle(stopwatchManager.selectedSession?.name ?? "")
        .onChange(of: stopwatchManager.running) { _ in
            displayMetricsView()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .onChange(of: isLuminanceReduced) { _ in
            displayMetricsView()
        }
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .cancellationAction) {
//                Button {
//                    stopwatchManager.resetSession()
//                } label: {
//                    Image(systemName: "chevron.backward")
//                }
//            }
//        }
    }
    
    private func displayMetricsView() {
        withAnimation {
            selection = .metrics
        }
    }
}

struct SessionPagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView().environmentObject(StopwatchManager(sessionActivityType: SessionActivityType.easy))
    }
}
