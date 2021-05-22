//
//  BalanceDetailView.swift
//  Trickle (iOS)
//
//  Created by Myron Wells on 5/21/21.
//

import SwiftUI

struct BalanceDetailView: View {
    
    @State var progressValue: Float = 60 * 60 * 14 // 10 hours in seconds
    @State var date: Date = Date()
    var body: some View {
        
        VStack {
            VStack(spacing: 16) {
                Text("Your Balance")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.system(size:34, weight: .medium))
                    //.font(Font.largeTitle.weight(.medium))
                    .padding(.top, 44)
                
                TrickleTimeStorageBar(showTimeLabel: true, value: progressValue).frame(height: 30)
                
                
                    DatePicker("",selection: $date, displayedComponents: .date)
                    
                               // .datePickerStyle(GraphicalDatePickerStyle())
               
            }
            .padding(25)
            
            
            VStack {
               
                Text("Time Transactions").font(.title).opacity(0.2)
                   
    
                ScrollView {
                      
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

struct BalanceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceDetailView()
    }
}
