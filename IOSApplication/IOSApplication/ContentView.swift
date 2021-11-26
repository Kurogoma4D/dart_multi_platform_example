//
//  ContentView.swift
//  IOSApplication
//
//  Created by t.suzuki on 2021/11/26.
//

import SwiftUI
import Flutter

struct ContentView: View {
    
    @State var count = 0
    @State var methodChannel: FlutterMethodChannel?
    @EnvironmentObject var appDelegate: AppDelegate
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
                Text("count: \(count)")
                Button(action: {
                    methodChannel?.invokeMethod("count", arguments: nil)
                }, label: {
                    Text("Press me").padding()
                })
            }
        }.onAppear(perform: {
            methodChannel = FlutterMethodChannel(name: "dart_multi_platform", binaryMessenger: appDelegate.flutterEngine.binaryMessenger)
            methodChannel?.setMethodCallHandler({
                (call: FlutterMethodCall, result: FlutterResult) -> Void in
                guard call.method == "countResult" else {
                    return
                }
                
                count = call.arguments as! Int
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
