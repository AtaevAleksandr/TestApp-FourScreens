//
//  OpenClosedView.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 05.09.2023.
//

import SwiftUI

struct OpenClosedView: View {
    @State private var goToFourthScreen = false
    @AppStorage("ShouldOpenFourthScreen") var shouldOpenFourthScreen: Bool = false

    var body: some View {
        Button("Go to fourth screen") {
            shouldOpenFourthScreen = true
            UserDefaults.standard.set(true, forKey: "ShouldOpenFourthScreen")
            goToFourthScreen = true
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .fullScreenCover(isPresented: $goToFourthScreen) {
            FourthView()
        }
        .padding()
    }
}
