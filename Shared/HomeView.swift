//
//  ContentView.swift
//  Shared
//
//  Created by Myron Wells on 4/1/21.
//

import SwiftUI

let screen: UIScreen = UIScreen.main

struct HomeView: View {
    var body: some View {
        
        
        VStack {
            HomeHeaderQuoteView()
            
            VStack {
                HStack {
                    Text("Your Trickles")
                    Spacer()
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }
                .font(Font.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                .padding()
                ScrollView {
                        TrickleCardView()
                        TrickleCardView()
                        TrickleCardView()
                        TrickleCardView()
                }
            }
            .padding()
            .background(Color(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 1, alpha: 1)))
            .cornerRadius(30)
    
        }
        .background(Color(#colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.8784313725, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}

struct TrickleSymbol: View {
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                Circle()
                    .strokeBorder(Color.pink,lineWidth: 4)
                    .background(Circle().foregroundColor(Color(.clear)))
                    .frame(width: 14, height: 14)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 2)
                
                Circle()
                    .strokeBorder(Color(#colorLiteral(red: 0.007843137255, green: 0.7803921569, blue: 0.7803921569, alpha: 1)),lineWidth: 4)
                    .background(Circle().foregroundColor(Color(.clear)))
                    .frame(width: 14, height: 14)
                
            }
            
        }
    }
}

struct TrickleCardView: View {
    
    @State var progressValue: Float = 60 * 60 * 10 // 10 hours in seconds
    var body: some View {
        VStack {
            VStack {
                
                HStack {
                    
                    TrickleSymbol()
                    
                    VStack(spacing:5) {
                        
                        
                        Text("Do some work on personal iOS app ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        
                        
                        Rectangle()
                            .fill(Color.black.opacity(0.1))
                            .frame(height: 1)
                        
                        
                        Text("Play Video Games")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .font(Font.subheadline)
                    
                    
                    
                    ZStack {
                        
                        let imageFrameSize: CGFloat = 40
                        Image(systemName: "gamecontroller")
                            .frame(width: imageFrameSize, height: imageFrameSize, alignment: .center)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1.0))
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y:5)
                            .font(.system(size: imageFrameSize/2))
                            .foregroundColor(Color.black.opacity(0.3))
                            .offset(y: -20)
                    }
                    
                    
                    
                    
                }
                TrickleTimeStorageBar(showTimeLabel: false, value: progressValue).frame(height: 6)
                    .padding()
            
                Text("Last Updated: Apr. 8, 2021")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(Font.caption2)
                    //.font(.system(size: 8))
                //.offset(y: 15)
            }
            .offset(y: 5)
            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            
            
        }
        .frame(width: screen.bounds.width - 70)
        .padding(20)
        //.padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y:5)
    }
}

struct HomeHeaderQuoteView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Hey Myron,")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
                .font(.system(size:34, weight: .medium))
                //.font(Font.largeTitle.weight(.medium))
                .padding(.top, 44)
            
            
            
            Text("\"Until we can manage time we can manage nothing else \"")
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color.white)
                .font(.system(size:22))
                //.font(.title2)
            
            Text("- Peter Preuller")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8039215686, blue: 0.6941176471, alpha: 1)))
                .font(.system(size:15, weight: .semibold))
                //.font(Font.subheadline.weight(.semibold))
        }
        .padding(25)
        
    }
}

extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

struct TrickleTimeStorageBar: View {
    var value: Float
    private var maxStorage: Float = 60 * 60 * 24 // 24 hours
    var showTimeLabel: Bool = false
    
    init(showTimeLabel: Bool, value: Float) {
        self.value = value
        self.showTimeLabel = showTimeLabel
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.08)
                    .foregroundColor(Color.black)
                
                
                Rectangle().frame(width: min(CGFloat(self.value / maxStorage)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor(#colorLiteral(red: 0.007843137255, green: 0.7803921569, blue: 0.7803921569, alpha: 1))))
                    .animation(.linear)
                
                if showTimeLabel {
                HStack {
                    Spacer()
                    Text("10 hrs")
                        .padding(.trailing, 10)
                        .font(.system(size: geometry.size.height / 2, weight: .bold))
                        .foregroundColor(Color(UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
                }
            }
            }.cornerRadius(45.0)
        }
    }
}
