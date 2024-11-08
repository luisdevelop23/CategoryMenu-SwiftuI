//
//  MealListView.swift
//  CategoryMenu
//
//  Created by Luis Alfredo Saavedra Falcon on 8/11/24.
//
import SwiftUI

struct MealListView: View {
    let category: Category
    @State private var meals: [Meal] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    // Función para cargar las comidas de la categoría
    func loadMeals() async {
        do {
            let fetchedMeals = try await DataService.shared.fetchMeals(category: category.strCategory)
            meals = fetchedMeals
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading meals...")
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                List(meals) { meal in
                    MealRow(meal: meal)
                }
            }
        }
        .onAppear {
            // Coloca la llamada asincrónica dentro de un bloque Task
            Task {
                await loadMeals()
            }
        }
        .navigationTitle(category.strCategory) // Muestra el nombre de la categoría seleccionada
    }
}
