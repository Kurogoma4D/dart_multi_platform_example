//
//  IOSApplicationApp.swift
//  IOSApplication
//
//  Created by t.suzuki on 2021/11/26.
//

import SwiftUI
import Flutter

@main
struct IOSApplicationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Ref: https://qiita.com/peter_parker/items/0ec7fce46b23ddc1b589
class AppDelegate: FlutterAppDelegate, ObservableObject {
    
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        flutterEngine.run()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
