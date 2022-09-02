//
//  AppDelegate.swift
//  pageControllerAppDemo
//
//  Created by iMac on 01/08/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit
//import Face

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var isDeviceportrait: Bool = false
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()

        
        
        //============= FACEBOOK ==========//
            ApplicationDelegate.shared.application(
              application,
              didFinishLaunchingWithOptions: launchOptions
            )
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      
          ApplicationDelegate.shared.application(
                      application,
                      open: url,
                      sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                      annotation: options[UIApplication.OpenURLOptionsKey.annotation]
                  )
          return GIDSignIn.sharedInstance.handle(url)
      }

   

}

extension AppDelegate{
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return isDeviceportrait ? .portrait : .all
    }
    
    func resetOrientation(){
        isDeviceportrait = true
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}

