//
//  CreateNewView.swift
//  Trickle (iOS)
//
//  Created by Myron Wells on 4/14/21.
//

import SwiftUI
import BottomSheet

struct CreateNewView: View {
    @State var tapped: Bool = false
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Let's create a new")
                    .font(.system(size:34, weight: .medium))
                Text("Trickle!")
                    .font(.system(size:44, weight: .bold))
            }
            .foregroundColor(Color.white)
            
            
            VStack(spacing: 16) {
                Text("I'd like to trickle my time spent on ...")
                    .font(.system(size:28, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                HStack {
                    Circle()
                        .strokeBorder(Color(#colorLiteral(red: 0.8980392157, green: 0.04705882353, blue: 0.662745098, alpha: 1)),lineWidth: 7)
                        .background(Circle().foregroundColor(Color(.clear)))
                        .frame(width: 25, height: 25)
                    TextField("Priority Task", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                
                .padding()
                .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .cornerRadius(10)
                
                
                Text("To")
                    .font(.system(size:28, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                HStack {
                    Circle()
                        .strokeBorder(Color(#colorLiteral(red: 0.007843137255, green: 0.7803921569, blue: 0.7803921569, alpha: 1)),lineWidth: 7)
                        .background(Circle().foregroundColor(Color(.clear)))
                        .frame(width: 25, height: 25)
                    TextField("Leisure Task", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .cornerRadius(10)
            }
            .frame(maxWidth: 330)
            .padding(.horizontal, 20)
            .padding(.vertical, 50)
            .background(Color.green)
            .cornerRadius(30)
            
            HStack {
                Circle()
                    .strokeBorder(Color(#colorLiteral(red: 0.8980392157, green: 0.04705882353, blue: 0.662745098, alpha: 1)),lineWidth: 7)
                    .background(Circle().foregroundColor(Color(.clear)))
                    .frame(width: 25, height: 25)
                TextField("Priority Task", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            .background(Color.purple)
                .onTapGesture {
                    self.tapped.toggle()
                }
            //.animation(.spring())
         
          
                
            
            
            
        }
        .background(Color(#colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.8784313725, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .bottomSheet(isPresented: self.$tapped.animation(.easeIn(duration:3)), height: 370, topBarHeight: 16, topBarCornerRadius: 16, topBarBackgroundColor: Color.pink, showTopIndicator: false) {
            Text("Test")
        }
    
    }
    
}

struct CreateNewView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewView()
    }
}
