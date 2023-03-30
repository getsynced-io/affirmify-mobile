//
//  NotificationTimeView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI


enum DateType: String,CaseIterable{
    case From , To
}
struct NotificationTimeView: View , SettingsViewProtocol {
    @StateObject var userConfigVM : UserConfigurationVM = UserConfigurationVM.shared
    @State var showTimeSheet : Bool = false
    @State var dateType: DateType = .From
    @State var nextViewIsActive : Bool = false
    var calledFromConfiguration : Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color._000000.ignoresSafeArea()
            ZStack(alignment: .bottom){
                VStack(spacing: 0){
                    nextView
                    
                    if calledFromConfiguration {
                        SettingsHeaderView(title: "Reminders", cancelHandler: {
                            withAnimation {
                                presentationMode.wrappedValue.dismiss()
                            }
                        })
                        
                    }
                    header
                        .padding(.horizontal , 16)
                        .padding(.top , 32 + (calledFromConfiguration ? 0  :  44))
                    
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
                    
                    
                    GreenButtonView(buttonTitle:calledFromConfiguration ? "Save" : "Next") {
                        userConfigVM.userConfig.from  = Date()
                        if calledFromConfiguration {
                            
                            LocalNotificationManager.shared.scheduleNotifications(from: userConfigVM.userConfig.from, to: userConfigVM.userConfig.to, quantity: userConfigVM.userConfig.quantity) {
                                DispatchQueue.main.async {
                                    presentationMode.wrappedValue.dismiss()
                                }
                                
                            }
                        }
                        else {
                            withAnimation {
                                nextViewIsActive = true
                            }
                        }
                        
                    }
                    .padding([.horizontal,.top] ,16)
                    .padding(.bottom ,32)
                    .onChange(of: dateType) { newValue in
                        print("newValue \(newValue)")
                    }
                    
                    
                }
                .ignoresSafeArea(.keyboard,edges: .all)
                
                .background(Color._F6F5EC.ignoresSafeArea())
                
                timeSheet(userConfigVM: userConfigVM, dateType: $dateType, showTimeSheet: $showTimeSheet)
                
                
            }
        }
    }
    
    
    var nextView : some View {
        CustomNavigationLink(isActive: $nextViewIsActive) {
            NotificationRequestView(userConfigVM: userConfigVM)
                .background(Color._000000.ignoresSafeArea())
        }
    }
    

    
    var header : some View {
        Text("Focus on what truly matters with reminders")
            .customFont(font: .InterMedium , size: 24 , color: ._FFFFFF)
            .multilineTextAlignment(.center)
      
    }
    var Quantity : some View {
        HStack(spacing: 0){
            Text("Quantity")
                .customFont(font: .InterRegular, size: 16 , color: ._FFFFFF)
            Spacer(minLength: 0)
            
            HStack(spacing: 8) {
                IncrementalButton(operation: .minus, counter: $userConfigVM.userConfig.quantity, counterLimit: 0)
                Text("\(userConfigVM.userConfig.quantity)x")
                    .customFont(font: .InterRegular, size: 16 , color: ._FFFFFF)
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
                    datePicker
                }
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .accentColor(Color._FFFFFF)
   
            }
            .height(.fixed(162))
        
        
    }
    
    var datePicker : some View {
      return   Group {
            switch dateType {
            case .From:
                DatePicker("", selection: $userConfigVM.userConfig.from, displayedComponents: .hourAndMinute)
                    .colorScheme(.light)
              
            case .To:
                DatePicker("", selection: $userConfigVM.userConfig.to, displayedComponents: .hourAndMinute)
                    .colorScheme(.light)
                 
            }
        }
    }
}




 enum OperationType : String  {
    case plus = "circle-plus" , minus = "circle-minus"
}

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
            .customFont(font: .InterRegular, size: 16 , color: ._FFFFFF)
            
            Spacer(minLength: 0)
            HStack(spacing: 16){
                Text("\(date.display("hh:mm"))")
                    .frame(width: 64)
                    .customFont(font: .InterMedium, size: 16 , color: ._FFFFFF)
                    .padding(.vertical ,4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(lineWidth: 1)
                        .foregroundColor(._FFFFFF.opacity(0.16))
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
            .customFont(font: .InterMedium, size: 16 , color: dateFormat == amPm ? Color._FFFFFF : Color._FFFFFF)
            .frame(width: 48)
            .padding(.vertical ,4)
            .if(dateFormat == amPm, transform: { view in
                view
                    .background(
                   RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(._5138EE)
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
                .background(Color.gray.cornerRadius(8))
                .opacity(showPicker ? 1 : 0 )
                .offset(x: 50, y: 90)
        ).onChange(of: date) { newValue in
            
            withAnimation {
                showPicker.toggle()
            }
        }
    }
}
