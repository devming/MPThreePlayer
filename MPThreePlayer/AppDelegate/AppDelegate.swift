//
//  AppDelegate.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/06.
//

import UIKit
import ModernRIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var launchRouter: LaunchRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        self.launchRouter = AppRootBuilder(dependency: AppComponent()).build()
//        self.launchRouter = result.launchRouter
        launchRouter?.launch(from: window)
        
        return true
    }
    
}
