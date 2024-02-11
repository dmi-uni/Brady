//
//  SummaryView.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var stopwatchManager: StopwatchManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)
                .opacity(0.2)
            
            VStack() {
                HStack {
                    Image("SlothMouthClose")
                        .resizable()
                        .frame(width: 30.adaptedWidth(), height: 31.adaptedHeight())
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack{
                    
                    Text("Yup! Your meal lasted \(stopwatchManager.elapsedTime.minuteFormat) min. Have a nice digestion!")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.top)
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                stopwatchManager.showingSummaryView.toggle()
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
