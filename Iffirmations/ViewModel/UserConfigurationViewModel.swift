//
//  UserConfigurationViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI

class UserConfigurationVM : ObservableObject {
    @AppStorage("userConfig") var  userConfig :  UserConfiguration =  UserConfiguration()
    
    @objc func handleDatePicker(_ datePicker: UIDatePicker) {
        if datePicker.tag == 1 {
            userConfig.from = datePicker.date
        } else if datePicker.tag == 2 {
            userConfig.to = datePicker.date
        }
    }
    
    
    @objc func  hideKeyb(){
        UIApplication.shared.dismissKeyboard()
    }
}



extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
