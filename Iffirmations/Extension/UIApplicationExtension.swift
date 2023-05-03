//
//  UIApplicationExtension.swift
//  scanZi
//
//  Created by Fares Cherni on 11/10/2022.
//

import UIKit
import SwiftUI
import StoreKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
    var keyWindowPresentedController: UIViewController? {
        var viewController = self.keyWindow?.rootViewController
        if let presentedController = viewController as? UITabBarController {
            viewController = presentedController.selectedViewController
        }
        while let presentedController = viewController?.presentedViewController {
            if let presentedController = presentedController as? UITabBarController {
                viewController = presentedController.selectedViewController
            } else {
                viewController = presentedController
            }
        }
        return viewController
    }
    
}




#if os(iOS)
extension UIApplication {
    var foregroundActiveScene: UIWindowScene? {
        connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
    }
}
#endif



class ReviewConfiguration : ObservableObject{
    static let shared : ReviewConfiguration = ReviewConfiguration()
    @AppStorage("lastShow") var lastShow : Date = Date()
    @AppStorage("yearTracker") var yearTracker : Date = Date()
    @AppStorage("counter") var counter : Int = 0
    @AppStorage("shouldAskForRating") var shouldAskForRating : Bool = false
    var waitingDays : Int {
        switch counter {
        case 0 : return 10
        case 1 : return 15
        default : return 25
         }
    }
  private  func showingHandler(){
        shouldAskForRating = false
        lastShow = Date()
        counter += 1
      if counter == 3 {
          yearTracker = Date().addOneYear() ?? Date()
          counter = 0
      }
    }
    
    func updateState(){
        guard let days  =  Calendar.current.numberOfDaysBetween(lastShow, and: Date())   else {return}
        guard let years = Calendar.current.numberOfYearsBetween(yearTracker, and: Date())  else {return}
        if days >= waitingDays && years == 0 {
            shouldAskForRating = true
        }
        else {
            shouldAskForRating = false
        }
    }
    func askForRatingIfNeeded(cancelHnadler : ()->() = {}) {
        guard shouldAskForRating else {cancelHnadler(); return }
        askForRating()
        
    }

private func askForRating() {

        #if os(macOS)
            SKStoreReviewController.requestReview()
        #else
            guard let scene = UIApplication.shared.foregroundActiveScene else { return }
            SKStoreReviewController.requestReview(in: scene)
        #endif
       showingHandler()
       updateState()
    }
}




extension Calendar {
    func numberOfYearsBetween(_ from: Date, and to: Date) -> Int? {
           let fromDate = startOfDay(for: from)
           let toDate = startOfDay(for: to)
           let numberOfYears = dateComponents([.year], from: fromDate, to: toDate)
           if let year = numberOfYears.year {
               return abs(year)
           } else {
               // Handle the case where numberOfYears.year is nil
               return nil
           }
       }
   }


extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int? {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        if let day = numberOfDays.day {
            return abs(day)
        } else {
            // Handle the case where numberOfDays.day is nil
            return nil
        }
    }
}

extension Date {
    func addOneYear() -> Date? {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 1
        return calendar.date(byAdding: dateComponents, to: self)
    }
}
