//
//  TestApp_4ScreensApp.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 04.09.2023.
//

import SwiftUI

@main
struct TestApp_4ScreensApp: App {
    @AppStorage("ShouldOpenFourthScreen") var shouldOpenFourthScreen = false
    
    var body: some Scene {
        WindowGroup {
            if shouldOpenFourthScreen {
                FourthView()
            } else {
                ContentView()
            }
        }
    }
}
