//
//  AppDelegate.swift
//  UIPasteboard
//
//  Created by This is Terminator on 16/01/2019.
//  Copyright © 2019 Deleted. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        checkPasteboard()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        checkPasteboard()
    }
    
    func checkPasteboard() {
        let notificationName = Notification.Name("applicationDidBecomeActive")
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    
}

