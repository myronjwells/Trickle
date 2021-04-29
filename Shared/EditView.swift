//
//  EditView.swift
//  Trickle (iOS)
//
//  Created by Myron Wells on 4/28/21.
//

import SwiftUI
import BottomSheet

struct EditView: View {
    @State var tapped: Bool = false
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                HStack {
                    Spacer()
                    Text("Create")
                        .fontWeight(.heavy)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8039215686, blue: 0.6941176471, alpha: 1)))
                }
                
                VStack {
                    Text("Let's create a new")
                        .font(.system(size:34, weight: .medium))
                    Text("Trickle!")
                        .font(.system(size:44, weight: .bold))
                }
                .foregroundColor(Color.white)
                
                
                TrickleNeumorphismStyleContainerView {
                  
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
                
                VStack(spacing: 20) {
                    HStack(alignment: .center) {
                        Text("Category")
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    //.frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .font(Font.body.weight(.medium))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .cornerRadius(10)
                    .onTapGesture {
                        self.tapped.toggle()
                    }
                    
                    HStack(alignment: .center) {
                        Text("Siri Shortcut")
                        Spacer()
                        Image(systemName: "chevron.down")
                        
                        
                    }
                    //.frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .font(Font.body.weight(.medium))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    
                    .cornerRadius(10)
                    .onTapGesture {
                        self.tapped.toggle()
                    }
                    
                    VStack {
                        HStack {
                            Text("Difficulty")
                                .font(Font.body.weight(.bold))
                            Image(systemName: "info.circle")
                        }
                        
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                        HStack(spacing: 20) {
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 25, height: 25)
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 25, height: 25)
                            Circle()
                                .fill(Color(#colorLiteral(red: 1, green: 0.3882352941, blue: 0.3490196078, alpha: 1)))
                                .frame(width: 25, height: 25)
                            
                        }
                    }
                    
                }
                .padding(.horizontal, 20)
                
            }
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 44)
        .background(Color(#colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.8784313725, alpha: 1)))
        //.padding(.horizontal, 22)
        .edgesIgnoringSafeArea(.all)
        .bottomSheet(isPresented: self.$tapped.animation(.easeIn(duration:3)), height: 370, topBarHeight: 16, topBarCornerRadius: 16, topBarBackgroundColor: Color.pink, showTopIndicator: false) {
            Text("Test")
        }
        
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}