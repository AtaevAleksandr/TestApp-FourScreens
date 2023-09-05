//
//  TabBarElementView.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 04.09.2023.
//

import SwiftUI

struct TabBarElementView: View {
    var iconName: String
    var title: String
    var view: AnyView

    var body: some View {
        NavigationView {
            view
                .navigationTitle(title)
        }
    }
}

struct TabBarElementView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarElementView(iconName: "person", title: "Person", view: AnyView(FirstView()))
    }
}
