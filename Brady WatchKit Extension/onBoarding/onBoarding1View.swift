//
//  onBoarding1View.swift
//  Brady WatchKit Extension
//
//  Created by Martina Esposito on 15/06/22.
//

import SwiftUI

struct onBoarding1View: View {
    @AppStorage("localOnBoarding") var localOnBoarding: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)
                .frame(width: 147.adaptedWidth(), height: 140.adaptedHeight())
                .opacity(0.2)
            
            VStack {
                HStack {
                    Image("SlothMouthClose")
                        .resizable()
                        .frame(width: 24.adaptedWidth(), height: 25.adaptedHeight())
                    
                    Spacer()
                }
                .padding(.horizontal, 11.adapted())
                
                Text("Hi! I'm Brady and I'm going to help you to eat more slowly. Let's start!")
                    .font(.system(size: 14.adapted()))
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 10.adapted())
                
                Spacer()
                
            }
            .padding(.top)
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                localOnBoarding = false
            }
        }
    }
}

//struct onBoarding1View_Previews: PreviewProvider {
//    static var previews: some View {
//        onBoarding1View()
//    }
//}
