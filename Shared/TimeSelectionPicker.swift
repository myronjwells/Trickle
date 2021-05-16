//
//  TimeSelectionPicker.swift
//  Trickle (iOS)
//
//  Created by Myron Wells on 5/4/21.
//

import SwiftUI

struct TimeSelectionPicker: View {
    var body: some View {
        
        
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack {
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                        Text("3").tag(3)
                        /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                        Text("3").tag(3)
                    }
                    .frame(width: geometry.size.width/6, height: geometry.size.height)
                    .background(Color.pink)
                    .clipped()
                    
                    Text("hours")
                }
                
                Text(":")
                    //.frame(width: geometry.size.width/6)
                
                VStack {
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        Text("1").tag(3)
                        Text("2").tag(4)
                    }
                    .frame(width: geometry.size.width/6, height: geometry.size.height)
                    .background(Color.green)
                    .clipped()
                    
                    Text("minutes")
                }
                
                Text(":")
                    //.frame(width: geometry.size.width/6)
                
                
                VStack {
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        Text("1").tag(5)
                        Text("2").tag(6)
                    }
                    .frame(width: geometry.size.width/6, height: geometry.size.height)
                    .background(Color.blue)
                    .clipped()
                    
                    Text("seconds")
                }
                
                Spacer()
            }
            .frame(height: geometry.size.height)
            .background(Color.gray)
        
        }
       
        
        
    }
}

struct TimeSelectionPicker_Previews: PreviewProvider {
    static var previews: some View {
        TimeSelectionPicker()
    }
}
