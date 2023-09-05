//
//  SaveDataView.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 05.09.2023.
//

import SwiftUI

struct SaveDataView: View {
    @State var savedText: [String] = UserDefaults.standard.stringArray(forKey: "text_key") ?? []
    @State var inputText: String = ""
    @State var showingAlert = false

    var body: some View {
        VStack {
            TextField("Input Data", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding()

            Button(action: {
                if !inputText.isEmpty {
                    savedText.append(inputText)
                    inputText = ""
                    UserDefaults.standard.set(savedText, forKey: "text_key")
                } else if inputText.isEmpty {
                    showingAlert = true
                }
            }) {
                Text("Save Data")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            List(savedText, id: \.self) { data in
                Text(data)
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text("Input Data is empty"), dismissButton: .default(Text("OK")))
        }
    }
}
