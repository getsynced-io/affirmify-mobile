//
//  LocalNotificationManager.swift
//  Iffirmations
//
//  Created by Fares Cherni on 07/03/2023.
//

import UIKit
import UserNotifications

class LocalNotificationManager: ObservableObject {
    static let shared = LocalNotificationManager()
    func scheduleNotifications(from: Date, to: Date, quantity: Int,handler: @escaping ()->()) {
        // Check if "to" date is before "from" date, and swap if necessary
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        var fromDate = from
        var toDate = to
        if fromDate > toDate {
            swap(&fromDate, &toDate)
        }
        
        // Request permission to show notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification permission: \(error.localizedDescription)")
                handler()
                return
            }
            
            guard granted else {
                print("Notification permission not granted")
                handler()
                return
            }
            
            // Notification permission granted, schedule notifications
            let content = UNMutableNotificationContent()
            content.title = "Affirmation of the Day"
            content.sound = UNNotificationSound.default
            
            let calender = Calendar.current
            let timeInterval = (toDate.timeIntervalSince(fromDate) / Double(quantity)).rounded()
         
     
            
            if quantity >= 1 {
                for i in 1...quantity {
                    let notificationDate = fromDate.addingTimeInterval(Double(i) * timeInterval)
                    var dateComponents = DateComponents(calendar: calender,timeZone: .current)
                    dateComponents.hour = calender.component(.hour, from: notificationDate)
                    dateComponents.minute = calender.component(.minute, from: notificationDate)
                   // print("calender.component(.minute, from: fromDate) \(calender.component(.minute, from: fromDate))")
                    dateComponents.timeZone = .current
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                 
                    let quote = WQuoteViewModel.shared.freeQuotes.randomElement()
                    content.body = quote?.text ?? "Error: Update Settings"
                    
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request) { error in
                        if let error = error {
                            print("Error scheduling notification: \(error.localizedDescription)")
                            return
                        }
                      //  print("done")
                    }
                }
            }
            
            handler()
            
            
        }
    }

}
