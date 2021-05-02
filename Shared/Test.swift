//
//  Test.swift
//  Trickle (iOS)
//
//  Created by Myron Wells on 5/2/21.
//

import SwiftUI

struct Test: View {
    @State private var isShowingSheet = false
    var body: some View {
        Button(action: {
            isShowingSheet.toggle()
        }) {
            Text("Show Test Modal")
        }
        .sheet(isPresented: $isShowingSheet, content: {
            
            VStack {
                
                Text("Whats New in SMHS Schedule")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Spacer()
                Button(action: {}, label: {
                                Text("Continue")
                                    .font(.body)
                                    .fontWeight(.semibold)
                            })
                            .buttonStyle(HighlightButtonStyle())
                //.animation(Animation.easeInOut(duration: 30))
                            .padding(.bottom)
             
            }
        })
    }
}

struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width - CGFloat(100))
            .padding()
            .background(Color.primary)
            .foregroundColor(Color.green)
            .clipShape(Capsule(style: .continuous))

//            .brightness(configuration.isPressed ? -0.1 : 0)
//            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
