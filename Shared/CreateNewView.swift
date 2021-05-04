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
    @State var editMode: EditMode = .inactive
    @State var progressValue: Float = 60 * 60 * 14 // 10 hours in seconds
    @State var selectedBackTime = 2
    
    private var isCreate: Bool
    
    
    init(isCreatePage: Bool) {
        self.isCreate = isCreatePage
        
    }
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                
                
                if isCreate {
                    TrickleModifierPageButton(title: .create) {
                        // Save New Trickle Data
                    }
                    
                    VStack {
                        Text("Let's create a new")
                            .font(.system(size:34, weight: .medium))
                        Text("Trickle!")
                            .font(.system(size:44, weight: .bold))
                    }
                    .foregroundColor(Color.white)
                } else {
                    TrickleModifierPageButton(title: self.editMode.isEditing ? .save : .edit) {
                        self.editMode.toggle()
                    }
                    
                    TrickleNeumorphismStyleContainerView {
                        
                        HStack {
                            Text("Your Balance")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8039215686, blue: 0.6941176471, alpha: 1)))
                        }
                        .font(.system(size:28, weight: .medium))
                        TrickleTimeStorageBar(showTimeLabel: true, value: progressValue).frame(height: 30)
                        
                        
                        GeometryReader { geometry in
                            
                            HStack {
                                Spacer()
                                Picker(selection: $selectedBackTime, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                                    Text("Deposit").tag(1)
                                    Text("Withdraw").tag(2)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .onAppear {
                                    UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.8784313725, alpha: 1)
                                    //UISegmentedControl.appearance().set
                                    UISegmentedControl.appearance().backgroundColor = UIColor(Color.black.opacity(0.08))
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white, .font : UIFont.preferredFont(forTextStyle: .body)], for: .selected)
                                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white, .font : UIFont.preferredFont(forTextStyle: .body)], for: .normal)
                                }
                                .frame(width: geometry.size.width / 2)
                                Spacer()
                            
                            }
                            
                        }
                        
                        
                        
                        TimeSelectionPicker()
                        // TAKE A LOOK AT THE LINK BELOW IT MIGHT HELP UNDERSTAND HOW TO FIX THE SCALING ISSUE OF YOUR PICKERVIEW WHEN ADDING TO OTHER VIEWS. TRYING TO SEE IF I SHOULD PASS DOWN THE FRAME FROM THE PARENT VIEW(CREATENEWVIEW) TO THE CHILD(TIMESELECTIONPICKER)
                        
                        //https://swiftui-lab.com/communicating-with-the-view-tree-part-1/
//                        TrickleNeumorphismStyleContainerView {
//                            TimeSelectionPicker()
//                        }
                        
                            
                        
                    }
                    
                }
                
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

struct MultiPicker: View  {

    typealias Label = String
    typealias Entry = String

    let data: [ (Label, [Entry]) ]
    @Binding var selection: [Entry]

    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0..<self.data.count) { column in
                    Picker(self.data[column].0, selection: self.$selection[column]) {
                        ForEach(0..<self.data[column].1.count) { row in
                            Text(verbatim: self.data[column].1[row])
                            .tag(self.data[column].1[row])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
                    .clipped()
                }
            }
        }
    }
}

struct CreateNewView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewView(isCreatePage: false)
    }
}

extension EditMode {
    
    mutating func toggle() {
        self = self == .active ? .inactive : .active
    }
}


protocol ContainerView: View {
    associatedtype Content
    init(content: @escaping () -> Content)
}

struct TrickleNeumorphismStyleContainerView<Content: View>: ContainerView {
    
    var content: () -> Content
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    
    
    init(spacing: CGFloat = 20, horizontalPadding: CGFloat = 20, verticalPadding: CGFloat = 50, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = spacing
        self.content = content
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.spacing = 20
        self.horizontalPadding = 20
        self.verticalPadding = 50
    }
    var body: some View {
        VStack(spacing: spacing, content: content)
            //.frame(maxWidth:300)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(Color(#colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.8784313725, alpha: 1)))
            .cornerRadius(30)
            .shadow(color: Color(#colorLiteral(red: 0.262745098, green: 0.2862745098, blue: 0.831372549, alpha: 1)), radius: 10, x: 10, y: 10)
            .shadow(color: Color(#colorLiteral(red: 0.2549019608, green: 0.2784313725, blue: 0.8431372549, alpha: 1)), radius: 10, x: -10, y: -10)
    }
}

struct TrickleModifierPageButton: View {
    
    enum TrickleModifierButtonType: String, Equatable, CaseIterable {
        case create  = "Create"
        case edit = "Edit"
        case save  = "Save"
        
        var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    }
    
    let title: TrickleModifierButtonType
    let action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(title.rawValue, action: action)
                .font(Font.body.bold())
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8039215686, blue: 0.6941176471, alpha: 1)))
            
        }
    }
}
