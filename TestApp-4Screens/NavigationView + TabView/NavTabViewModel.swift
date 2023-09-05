//
//  NavTabViewModel.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 04.09.2023.
//

import Foundation
import SwiftUI

final class NavTabViewModel {

    struct NavTabViewComponent: Identifiable {
        let id = UUID()
        let iconName: String
        let title: String
        let view: AnyView
    }

    let components = [
        NavTabViewComponent(iconName: "1.circle", title: "First Screen", view: AnyView(FirstView())),
        NavTabViewComponent(iconName: "2.circle", title: "Second Screen", view: AnyView(SecondView())),
        NavTabViewComponent(iconName: "3.circle", title: "Third Screen", view: AnyView(ThirdView()))
    ]
}
