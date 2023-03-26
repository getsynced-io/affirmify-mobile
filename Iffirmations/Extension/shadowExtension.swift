//
//  shadowExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 23/03/2023.
//

import UIKit
import SwiftUI

    extension CALayer {
      func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
      {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
          shadowPath = nil
        } else {
          let dx = -spread
          let rect = bounds.insetBy(dx: dx, dy: dx)
          shadowPath = UIBezierPath(rect: rect).cgPath
        }
      }
    }


struct customImageView: UIViewRepresentable {
    let size : CGSize
    let color : UIColor , alpha : Float , x : CGFloat , y: CGFloat,blur : CGFloat ,spread : CGFloat = 0.0
    let image : UIImage
    func makeUIView(context: Context) -> UIView {
        let myView  = UIImageView(frame: CGRect(origin: .zero, size: size))
        myView.image = image
        myView.contentMode = .scaleAspectFit
//        myView.layer.setupShadowView(color: color, alpha: alpha, x: x, y: y, blur: blur)
        myView.layer.applySketchShadow(color: color, alpha: alpha, x: x, y: y, blur: blur, spread: spread)
        return myView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // update the view if needed
    }
}
