//
//  BradyMessageView.swift
//  Brady WatchKit Extension
//
//  Created by Danil Masnaviev on 07/06/22.
//

import SwiftUI

struct BradMessageView: View {
    @AppStorage("brady") var brady = true
    
    @EnvironmentObject var stopwatchManager: StopwatchManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)
                .opacity(0.2)
                .frame(width: 147.adaptedWidth(), height: 140.adaptedHeight())
            VStack {
                HStack{
                    Image("SlothMouthClose")
                        .resizable()
                        .frame(width: 24.adaptedWidth(), height: 25.adaptedHeight())
                        .padding(.horizontal,6.adapted())
                        .padding(.top)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Text("Hi! Take a bite when you feel the vibration and try follow the rhythm!")
                    .fontWeight(.regular)
                    .font(.system(size: 14.adapted()))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 14)
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            stopwatchManager.pause()
            print("INSIDE ON APPEAR")
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                print("INSIDE DISPATCH BLOCK")
                brady = false
                stopwatchManager.resume()
            }
            
        }
    }
}
