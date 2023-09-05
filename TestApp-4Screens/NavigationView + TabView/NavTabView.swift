//
//  NavTabView.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 04.09.2023.
//

import SwiftUI

struct NavTabView: View {
    let viewModel = NavTabViewModel()

    init() {
        UITabBar.appearance().backgroundColor = UIColor.tertiarySystemBackground
    }

    var body: some View {
        TabView {
            ForEach(viewModel.components, id: \.id) { component in
                TabBarElementView(iconName: component.iconName,
                                  title: component.title,
                                  view: component.view)
                .tabItem {
                    Label(component.title, systemImage: component.iconName)
                }
            }
        }
    }
}

struct NavTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavTabView()
    }
}
