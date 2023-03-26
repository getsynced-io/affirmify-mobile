//
//  IffirmationsApp.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI
import RevenueCat
import GoogleMobileAds
import FacebookCore

@main
struct IffirmationsApp: App {
    @StateObject var paymentVM = StoreViewModel.shared
    @StateObject var wQuoteVM : WQuoteViewModel =  WQuoteViewModel.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var launchScreen: Bool = true
    @AppStorage("FeaturedCategory") var featuredCategory : String = ""
    var body: some Scene {
        WindowGroup {
            Group{
                switch launchScreen {
                case true :  splashScreen.transition(.opacity)
                case false :   ContentView(wQuoteVM: wQuoteVM)
                }
            }
            .preferredColorScheme( .light)
            .onAppear {
                firstCall()
            }
           
              
        }
    }
    
    var splashScreen : some View {
        LaunchScreen()
            .preferredColorScheme( .light)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    withAnimation {
                        launchScreen = false
                    }
                }
            }

    }
    
    func firstCall() {
        Task {
            do {
                paymentVM.offerings = try await Purchases.shared.offerings()
                paymentVM.refreshSubscription()
                APIManager.shared.getBiggestCategory { result in
                    switch result{
                    case .success(let category) :
                        featuredCategory = category.category
                        print("category \(category)")
                    case .failure(let error):
                        print("FeaturedFlaskApi Error \(error)")
                    }
                }
            } catch{
            }
        }
    }
}



class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      //initialise revenueCat
      Purchases.logLevel = .error
      Purchases.configure(withAPIKey: Constants.apiKey)
      Purchases.shared.delegate = PurchasesDelegateHandler.shared
      //initialise admob
      GADMobileAds.sharedInstance().start(completionHandler: nil)
      GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "22025892c524aac5dab3377cc9efde0e" ]
      UNUserNotificationCenter.current().delegate = self
      
      //facebook
      ApplicationDelegate.shared.application(
              application,
              didFinishLaunchingWithOptions: launchOptions
          )

      
    return true
  }
    
    func application(
          _ app: UIApplication,
          open url: URL,
          options: [UIApplication.OpenURLOptionsKey : Any] = [:]
      ) -> Bool {
          ApplicationDelegate.shared.application(
              app,
              open: url,
              sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
              annotation: options[UIApplication.OpenURLOptionsKey.annotation]
          )
      }
    
    func application(
      _ application: UIApplication,
      configurationForConnecting connectingSceneSession: UISceneSession,
      options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
      let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
      sceneConfig.delegateClass = SceneDelegate.self // 👈🏻
      return sceneConfig
    }
    
}




class SceneDelegate: NSObject, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        if userActivity.activityType == "com.Quottie.Quotes.viewquotes" {
            let category = userActivity.userInfo?["category"] as? String ?? ""
            NotificationCenter.default.post(name:  NSNotification.categoryIntent , object: nil, userInfo: ["category":category])
            NavigationUtil.popToRootView() 
          }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }

        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}
//User Notification

extension NSNotification {
    static let categoryIntent = Notification.Name.init("categoryIntent")
    static let snapshot = Notification.Name.init("Snapshot")
    static let scrollToTheme = Notification.Name.init("scrollToThemt")
    static let scrollToFirst  = Notification.Name.init("scrollToFirst")
}

extension AppDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("got notification")
        completionHandler([[.alert ,.badge , .sound]])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        print("got notification  dc")
        completionHandler()
    }
    
    
}
