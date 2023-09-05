//
//  FourthView.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 04.09.2023.
//

import SwiftUI

struct FourthView: View {
    var body: some View {
        WebView(urlString: "https://www.google.com")
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
