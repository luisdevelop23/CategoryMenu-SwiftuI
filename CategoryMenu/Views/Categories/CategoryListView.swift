//
//  CategoryListView.swift
//  CategoryMenu
//
//  Created by Luis Alfredo Saavedra Falcon on 7/11/24.
//

import SwiftUI

struct CategoryListView: View {
    @State private var categories: [Category] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading categories...")
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(categories) { category in
                            NavigationLink(destination: MealListView(category: category)){
                                CategoryCardView(category: category)

                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Categorías")
            }
        }
        .task {
            await loadCategories()
        }
    }
    
    private func loadCategories() async {
        do {
            categories = try await DataService.shared.fetchCategories()
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
