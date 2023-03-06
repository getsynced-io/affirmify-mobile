//
//  CustomSlider.swift
//  scanZi
//
//  Created by Fares Cherni on 05/10/2022.
//

import SwiftUI

struct SwiftUISlider<T: Comparable & BinaryFloatingPoint>: UIViewRepresentable {


 
  var thumbColor: UIColor = .white
  var minTrackColor: UIColor?
  var maxTrackColor: UIColor?
  @Binding var value: T
  let range : ClosedRange<T>
  func makeUIView(context: Context) -> UISlider {
      let slider = CustomSlider(frame: .null)
      slider.thumbTintColor = thumbColor
      slider.value = Float(value)
      slider.minimumValue = Float(range.lowerBound)
      slider.maximumValue = Float(range.upperBound)
      slider.setThumbImage(UIImage(named: "BgCircle"), for: .normal)
      slider.setThumbImage(UIImage(named: "BgCircle"), for: .selected)
      slider.setThumbImage(UIImage(named: "BgCircle"), for: .application)
      slider.setThumbImage(UIImage(named: "BgCircle"), for: .focused)
      slider.setThumbImage(UIImage(named: "BgCircle"), for: .highlighted)
      slider.setThumbImage(UIImage(named: "BgCircle"), for: .reserved)
      slider.minimumTrackTintColor = UIColor(named: "000000")
      slider.maximumTrackTintColor = UIColor(named: "000000")?.withAlphaComponent(0.16)
    slider.addTarget(
      context.coordinator,
      action: #selector(Coordinator.valueChanged(_:)),
      for: .valueChanged
    )

    return slider
  }

  func updateUIView(_ uiView: UISlider, context: Context) {
    // Coordinating data between UIView and SwiftUI view
    uiView.value = Float(self.value)
  }

  func makeCoordinator() -> SwiftUISlider.Coordinator {
    Coordinator(value: $value)
  }
    
    final class Coordinator: NSObject {
      // The class property value is a binding: It’s a reference to the SwiftUISlider
      // value, which receives a reference to a @State variable value in ContentView.
      var value: Binding<T>
      
        init(value: Binding<T>) {
            self.value = value
        }
      // Create a valueChanged(_:) action
      @objc func valueChanged(_ sender: UISlider) {
        self.value.wrappedValue = T(sender.value)
      }
    }
}



class CustomSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY)
        return CGRect(origin: point, size: CGSize(width: bounds.width, height: 1))
    }
    override func layoutSubviews() {
              super.layoutSubviews()

            self.layer.sublayers![0].cornerRadius = 4

        }
}
