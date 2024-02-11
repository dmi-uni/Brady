//
//  StartView.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import SwiftUI

struct StartView: View {
    @AppStorage("brady") var brady = true
    @EnvironmentObject var stopwatchManager: StopwatchManager
    
    var body: some View {
        List(SessionActivityType.allCases) { sessionType in
            NavigationLink(tag: sessionType, selection: $stopwatchManager.selectedSession) {
                
                if brady {
                    BradMessageView()
                } else {
                    SessionPagingView()
                }
                
            } label: {
                HStack {
                    Image(sessionType.color)
                        .resizable()
                        .frame(width: 22.adaptedWidth(), height: 13.adaptedHeight())
                    Text(LocalizedStringKey(sessionType.name))
                }
            }
        }
        .onAppear {
            stopwatchManager.endSession(showSummary: false)
            stopwatchManager.resetSession()
        }
        .listStyle(.plain)
        .navigationBarTitle("Brady")
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.defaultMinListRowHeight, 34.adaptedHeight())
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
