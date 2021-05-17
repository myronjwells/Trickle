//
//  SwiftUIView.swift
//  Trickle (iOS)
//
//  Created by Myron Wells on 5/16/21.
//

import SwiftUI




extension Color {
    struct pickerFontColorMode {
        static var dark: Color  { return  .black }
        static var light: Color { return .white }
    }
}

struct SwiftUIView: View {
    @State private var selection = 0
    @State private var selection2 = 0
    @State private var selection3 = 0
    let hours = [Int](0...24)
    let minutes = [Int](0...59)
    let seconds = [Int](0...59)
    
    var fontColor: Color
    var fontSize: CGFloat
    
    init(fontColor: Color = .pickerFontColorMode.dark, fontSize: CGFloat = 30) {
        self.fontColor = fontColor
        self.fontSize = fontSize
    }
    
    var body: some View {
        
        
        GeometryReader { geometry in
            VStack(spacing: 20) {
                
                
                TrickleNeumorphismStyleContainerView(horizontalPadding: 0,verticalPadding: 0, cornerRadius: 15)  {
                    HStack {
                        //Spacer()
                        
                        
                        Picker("Hours", selection: $selection) {
                            ForEach(0..<hours.count) { index in
                                
                                Text(String(format: "%02d", self.hours[index]))
                                    .font(.system(size: fontSize, weight: .bold))
                                    .foregroundColor(fontColor)
                            }
                        }
                        
                        
                        .frame(width: geometry.size.width/4, height: 60)
                        .clipped()
                        
                        
                        Text(":")
                            // .frame(width: geometry.size.width/6)
                            .font(.system(size: fontSize, weight: .bold))
                            .foregroundColor(fontColor)
                        
                        
                        
                        Picker("Minutes", selection: $selection2) {
                            ForEach(0..<minutes.count) { index in
                                Text(String(format: "%02d", self.minutes[index]))
                                    .font(.system(size: fontSize, weight: .bold))
                                    .foregroundColor(fontColor)
                            }
                        }
                        .labelsHidden()
                        .frame(width: geometry.size.width/4, height: 60)
                        .clipped()
                        
                        
                        Text(":")
                            //.frame(width: geometry.size.width/6)
                            .font(.system(size: fontSize, weight: .bold))
                            .foregroundColor(fontColor)
                        
                        
                        
                        Picker("Seconds", selection: $selection3) {
                            ForEach(0..<seconds.count) { index in
                                Text(String(format: "%02d", self.seconds[index]))
                                    .font(.system(size: fontSize, weight: .bold))
                                    .foregroundColor(fontColor)
                            }
                        }
                        .labelsHidden()
                        .frame(width: geometry.size.width/4, height: 60)
                        .clipped()
                        
                        
                        //Spacer()
                    }
                    
                }
                
                HStack {
                    Text("hours")
                        .font(.system(size: 13)).fontWeight(.bold)
                        .foregroundColor(fontColor)
                        .frame(width:geometry.size.width/3.5)
                    
                    Text("minutes")
                        .font(.system(size: 13)).fontWeight(.bold)
                        .foregroundColor(fontColor)
                        .frame(width:geometry.size.width/3.5)
                    
                    
                    
                    Text("seconds")
                        .font(.system(size: 13)).fontWeight(.bold)
                        .foregroundColor(fontColor)
                        .frame(width:geometry.size.width/3.5)
                    
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            //.background(Color.yellow)
            
        }
        
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
