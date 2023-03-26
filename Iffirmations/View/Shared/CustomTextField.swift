//
//  CustomTextField.swift
//  Iffirmations
//
//  Created by Fares Cherni on 28/02/2023.
//

import SwiftUI

struct TextFieldTyped: UIViewRepresentable {
    let keyboardType: UIKeyboardType
    let placeHolder: String
    let font : UIFont
    let attributedPlaceholder : UIFont?
    var textAlignment: NSTextAlignment
    let becomeFirstResponder : Bool
    @Binding var text: String
    @Binding var isKeyboardVisible: Bool
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width - 32, height: 48)))
        textField.keyboardType = self.keyboardType
        textField.textColor = UIColor(named : "000000")
        textField.font = font
        textField.textAlignment = textAlignment
        textField.text = text
        textField.contentMode = .scaleAspectFit
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder , attributes: [NSAttributedString.Key.foregroundColor : UIColor(named : "000000")! , NSAttributedString.Key.font : attributedPlaceholder != nil ? attributedPlaceholder! : font ])
        
        textField.delegate = context.coordinator
        
        textField.addTarget(context.coordinator,
                            action: #selector(Coordinator.textFieldTextChanged(_:)),
                            for: .editingChanged
        )
        
        return textField
        
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, UITextFieldDelegate, UIGestureRecognizerDelegate {
        var parent: TextFieldTyped
        init(_ textField: TextFieldTyped) {
            self.parent = textField
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.parent.isKeyboardVisible = false
        return    textField.resignFirstResponder()
        }
        
        @objc func textFieldTextChanged(_ textField: UITextField) {
            self.parent.text = textField.text ?? ""
        }
        func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.placeholder = ""
            self.parent.isKeyboardVisible = true
        }
        func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            textField.placeholder = self.parent.placeHolder
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
             if gestureRecognizer is UIPanGestureRecognizer {
                 return false
             }
             return true
         }
    }
}



struct CustomTextField: View {
    let placeHolder: String
    let font : UIFont
    var attributedPlaceholder : UIFont? = nil
    var textAlignment: NSTextAlignment = .center
    var becomeFirstResponder : Bool = true
    @Binding var text : String
    @Binding var isKeyboardVisible: Bool
    var body: some View {
        TextFieldTyped(keyboardType: .default,placeHolder: placeHolder, font: font, attributedPlaceholder: attributedPlaceholder, textAlignment: textAlignment, becomeFirstResponder: becomeFirstResponder, text: $text,isKeyboardVisible: $isKeyboardVisible)
    }
}
