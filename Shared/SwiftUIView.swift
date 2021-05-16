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
    let numbers = [Int](0...10)
    
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
                        Spacer()
                        
                        
                            Picker("Number", selection: $selection) {
                                ForEach(0..<numbers.count) { index in
                                    Text("\(self.numbers[index])")
                                        .font(.system(size: fontSize, weight: .bold))
                                        .foregroundColor(fontColor)
                                }
                            }
                            
                            //.labelsHidden()
                            .frame(width: geometry.size.width/6, height: 60)
                            .clipped()
                            
                
                        Text(":")
                            .frame(width: geometry.size.width/6)
                            .font(.system(size: fontSize, weight: .bold))
                            .foregroundColor(fontColor)
                        
                        
                       
                            Picker("Number", selection: $selection2) {
                                ForEach(0..<numbers.count) { index in
                                    Text("\(self.numbers[index])")
                                        .font(.system(size: fontSize, weight: .bold))
                                        .foregroundColor(fontColor)
                                }
                            }
                            .labelsHidden()
                            .frame(width: geometry.size.width/6, height: 60)
                            .clipped()
                            
                           
                        Text(":")
                            .frame(width: geometry.size.width/6)
                            .font(.system(size: fontSize, weight: .bold))
                            .foregroundColor(fontColor)
                        
                        
                       
                            Picker("Number", selection: $selection3) {
                                ForEach(0..<numbers.count) { index in
                                    Text("\(self.numbers[index])")
                                        .font(.system(size: fontSize, weight: .bold))
                                        .foregroundColor(fontColor)
                                }
                            }
                            .labelsHidden()
                            .frame(width: geometry.size.width/6, height: 60)
                            .clipped()
                            
                        
                        Spacer()
                    }
                }
                
                HStack {
                    Text("hours")
                        .font(.system(size: geometry.size.width < 305 ? 9: 12)).fontWeight(.bold)
                        .foregroundColor(fontColor)
                        .frame(width:geometry.size.width/6)
                    Text("")
                        .frame(width:geometry.size.width/6)
                    
                    Text("minutes")
                        .font(.system(size: geometry.size.width < 305 ? 9: 12)).fontWeight(.bold)
                        .foregroundColor(fontColor)
                        .frame(width:geometry.size.width/6)
                    
                    Text("")
                        .frame(width:geometry.size.width/6)
                    
                    Text("seconds")
                        .font(.system(size: geometry.size.width < 305 ? 9: 12)).fontWeight(.bold)
                        .foregroundColor(fontColor)
                        .frame(width:geometry.size.width/6)
                   
                }
            
            }
            
            //.background(Color.yellow)
            
        }
        
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
