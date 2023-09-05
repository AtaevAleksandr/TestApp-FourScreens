//
//  NetworkDataFetcherView.swift
//  TestApp-4Screens
//
//  Created by Aleksandr Ataev on 05.09.2023.
//

import Foundation
import SwiftUI

struct Fact: Codable, Identifiable {
    var id = UUID()
    let fact: String

    private enum CodingKeys: String, CodingKey {
        case fact
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fact = try container.decode(String.self, forKey: .fact)
    }
}

struct NetworkDataFetcherView: View {
    @State private var facts: [Fact] = []
    @State private var isLoading = false
    @State private var isError = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading...")
            } else {
                if isError {
                    Text("An error occurred while loading data.")
                        .foregroundColor(.red)
                } else {
                    List {
                        ForEach(0..<facts.count, id: \.self) { index in
                            Text("\(index + 1). \(facts[index].fact)")
                        }
                    }
                }
            }
        }
        .onAppear {
            loadData()
        }
    }

    func loadData() {
        isLoading = true

        guard let url = URL(string: "https://api.api-ninjas.com/v1/facts?limit=10") else {
            isError = true
            isLoading = false
            return
        }

        var request = URLRequest(url: url)
        request.setValue("5U90aLiRCtv8VymkVWm7bA==jx1NqlBCuUMkppRa", forHTTPHeaderField: "X-Api-Key")

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            isLoading = false

            if let error = error {
                print("Error: \(error)")
                isError = true
                return
            }

            guard let data = data else { return }

            do {
                let decodedData = try JSONDecoder().decode([Fact].self, from: data)
                facts = decodedData
            } catch {
                print("Decoding error: \(error)")
                isError = true
            }
        }
        task.resume()
    }
}


