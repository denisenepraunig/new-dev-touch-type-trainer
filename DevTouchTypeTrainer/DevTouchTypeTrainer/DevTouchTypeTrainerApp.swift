//
//  DevTouchTypeTrainerApp.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import SwiftUI

@main
struct DevTouchTypeTrainerApp: App {
    @StateObject var appVM = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(appVM)
                .navigationTitle("Dev Touch Type Trainer")
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willResignActiveNotification)) { _ in
                    appVM.isActive = false
                    // scenePhase did not work, only active was shown...
                }
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willBecomeActiveNotification)) { _ in
                    appVM.isActive = true
                }
        }
    }
}
