//
//  NotificationTimeView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI
fileprivate
enum DateType: String{
    case From , To
}
struct NotificationTimeView: View {
    @ObservedObject var userConfigVM : UserConfigurationVM
    @State var showTimeSheet : Bool = false
    @State private var dateType: DateType = .From
    @State var nextViewIsActive : Bool = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                VStack(spacing: 0){
                    nextView
                    
                    header
                        .padding(.horizontal , 16)
                    
                    Spacer(minLength: 0)
                    
                    
                    Quantity
                        .frame(height: 24)
                        .padding(16)
                    
                    seperator
                    
                    from
                        .frame(height: 32)
                        .padding(16)
                    
                    seperator
                    to
                        .frame(height: 32)
                        .padding(16)
                    
                    
                    GreenButtonView(buttonTitle: "Next") {
                        withAnimation {
                            nextViewIsActive = true
                        }
                    }
                    .padding([.horizontal,.top] ,16)
                    .padding(.bottom ,32)
                    
                    
                }
                .ignoresSafeArea(.keyboard,edges: .all)
              
                .background(Color._F6F5EC.ignoresSafeArea())
                .onAppear {
                    userConfigVM.userConfig.from = Date()
                    userConfigVM.userConfig.to =  Date().addHours(1)
                }
                
                timeSheet(userConfigVM: userConfigVM, dateType: $dateType, showTimeSheet: $showTimeSheet)
     
                  
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
    
    
    var nextView : some View {
        CustomNavigationLink(isActive: $nextViewIsActive) {
            NotificationRequestView()
        }
    }
    
    var seperator : some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.width - 32,height: 1)
            .foregroundColor(Color._000000.opacity(0.16))
        
    }
    
    var header : some View {
        Text("Focus on what truly matters with reminders")
            .customFont(font: .IBMPlexSerifMedium, size: 24 , color: ._000000)
            .multilineTextAlignment(.center)
            .padding(.top , 32 + 44)
    }
    var Quantity : some View {
        HStack(spacing: 0){
            Text("Quantity")
                .customFont(font: .IBMPlexSerifRegular, size: 16 , color: ._000000)
            Spacer(minLength: 0)
            
            HStack(spacing: 8) {
                IncrementalButton(operation: .minus, counter: $userConfigVM.userConfig.quantity, counterLimit: 0)
                Text("\(userConfigVM.userConfig.quantity)x")
                    .customFont(font: .IBMPlexSerifRegular, size: 16 , color: ._000000)
                    .frame(width: 32)
                IncrementalButton(operation: .plus, counter: $userConfigVM.userConfig.quantity, counterLimit: 10)
            }
        }
    }
    

    
    var from : some View {
        HStack(spacing: 0) {
            TimePicker(title: DateType.From, date: $userConfigVM.userConfig.from, userConfigVM: userConfigVM, dateType: $dateType,showTimeSheet: $showTimeSheet)
        }
    }
    
    var to : some View {
        HStack(spacing: 0) {
            TimePicker(title: DateType.To, date: $userConfigVM.userConfig.to, userConfigVM: userConfigVM, dateType: $dateType,showTimeSheet: $showTimeSheet)
        }
    }
    
 
    
}



fileprivate

struct timeSheet: View {
    @ObservedObject var userConfigVM : UserConfigurationVM
    @Binding var dateType: DateType
    @Binding var showTimeSheet : Bool
    var body: some View {
 
            HalfASheet(isPresented: $showTimeSheet,isDragable: false) {
              
                Group {
                    switch dateType {
                    case .From:
                        DatePicker("", selection: $userConfigVM.userConfig.from, displayedComponents: .hourAndMinute)
                    case .To:
                        DatePicker("", selection: $userConfigVM.userConfig.to, displayedComponents: .hourAndMinute)
                    }
                    
                }
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .accentColor(Color._000000)
            }
            .height(.fixed(162))
        
    }
}




fileprivate enum OperationType : String  {
    case plus = "circle-plus" , minus = "circle-minus"
}

fileprivate
struct IncrementalButton: View {
    var operation : OperationType
    @Binding var counter : Int
    var counterLimit : Int
    var body: some View {
        Button {
            switch operation {
            case .plus:
                if counter < counterLimit {
                    counter += 1
                }
                else {
                    HapticManager.instance.notification(type: .warning)
                }
            case .minus:
                if counter > counterLimit {
                    counter -= 1
                }
                else {
                    HapticManager.instance.notification(type: .warning)
                }
            }
        } label: {
            Image(operation.rawValue)
                .frame(width: 24,height:  24)
        }

     
    }
}



fileprivate
struct TimePicker: View {
    let title : DateType
    @Binding var date : Date
    @ObservedObject var userConfigVM : UserConfigurationVM
    @Binding var dateType: DateType
    @Binding var showTimeSheet : Bool
    var body: some View {
        HStack(spacing: 0) {
            Text(title.rawValue)
            .customFont(font: .IBMPlexSerifRegular, size: 16 , color: ._000000)
            
            Spacer(minLength: 0)
            HStack(spacing: 16){
                Text("\(date.display("hh:mm"))")
                    .frame(width: 64)
                    .customFont(font: .IBMPlexSerifMedium, size: 16 , color: ._000000)
                    .padding(.vertical ,4)
                    .background(
                    Capsule()
                        .strokeBorder(lineWidth: 1)
                        .foregroundColor(._000000)
                    )
                    .onTapGesture {
                        withAnimation {
                            dateType = title
                            showTimeSheet = true
                        }
                    }
            
                
                
                HStack(spacing: 0){
                    amPmPicker(.AM, dateFormat: date.amPmFromDate())
                    amPmPicker(.PM, dateFormat: date.amPmFromDate())
                }
                
                
            }
       
        }
    }
    
    func  amPmPicker(_ amPm: Date.TimeConvention,dateFormat : Date.TimeConvention ) -> some View {
        Text(amPm.rawValue)
            .customFont(font: .IBMPlexSerifMedium, size: 16 , color: dateFormat == amPm ? Color._FFFFFF : Color._000000)
            .frame(width: 48)
            .padding(.vertical ,4)
            .if(dateFormat == amPm, transform: { view in
                view
                    .background(
                    Capsule()
                        .foregroundColor(._000000)
                        .frame(width: 48)
                    )
            })
                .onTapGesture {
                switch amPm {
                case .AM:
                    switch dateFormat {
                    case .AM:
                        break
                    case .PM:
                        date = date.addHours(-12)
                    }
                case .PM:
                    switch dateFormat {
                    case .AM:
                        date = date.addHours(12)
                    case .PM:
                        break
                    }
                }
                
                
            }
   
    }
    
//    var textField : some View {
//        TextField("", text: .constant(title))
//            .customFont(font: .IBMPlexSerifRegular, size: 16 , color: ._000000)
//            .introspectTextField { uitextField in
//                var fromHourPicker: UIDatePicker = {
//                     let datePicker = UIDatePicker()
//                     if #available(iOS 13.4, *) {
//                         datePicker.preferredDatePickerStyle = .wheels
//                     }
//                     datePicker.datePickerMode = .time
//                     datePicker.tag = 1
//                     datePicker.timeZone = NSTimeZone.local
//                     datePicker.addTarget(userConfigVM, action: #selector(userConfigVM.handleDatePicker(_:)), for: .valueChanged)
//                     return datePicker
//                 }()
//
//                let toolBar = UIToolbar()
//                toolBar.barStyle = UIBarStyle.default
//                let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//                let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: userConfigVM, action: #selector(userConfigVM.hideKeyb))
//
//                let items = [flexSpace, done]
//                  toolBar.items = items
//                  toolBar.sizeToFit()
//                toolBar.backgroundColor = .red
//                uitextField.inputAccessoryView = toolBar
//                uitextField.inputView = fromHourPicker
//                uitextField.translatesAutoresizingMaskIntoConstraints = false
//                uitextField.backgroundColor = .clear
//                uitextField.tintColor = .clear
//
//
//            }}
    
    
}


extension UITextField {
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }
}
 




fileprivate
struct CustomDatePicker: View {
    @State private var showPicker = false
    @Binding  var date : Date
    var body: some View {
        Button {
            withAnimation {
                showPicker.toggle()
            }
        }  label: {
            Text("hello")
                .padding()
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )
        }
        .background(
            DatePicker("", selection: $date , displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .frame(width: 200, height: 100)
                .clipped()
                .background(Color.gray.cornerRadius(10))
                .opacity(showPicker ? 1 : 0 )
                .offset(x: 50, y: 90)
        ).onChange(of: date) { newValue in
            
            withAnimation {
                showPicker.toggle()
            }
        }
    }
}
