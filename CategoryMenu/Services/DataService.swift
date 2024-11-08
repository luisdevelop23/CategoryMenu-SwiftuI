//
//  DataService.swift
//  CategoryMenu
//
//  Created by Luis Alfredo Saavedra Falcon on 7/11/24.
//

import Foundation

class DataService {
    static let shared = DataService()
    private let apiURLCategory = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
    private let mealsBaseURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="

    func fetchCategories() async throws -> [Category] {
        let (data, _) = try await URLSession.shared.data(from: apiURLCategory)
        
        let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
        return apiResponse.categories
    }
    
    func fetchMeals(category: String) async throws -> [Meal]{
        // Usa la variable mealsBaseURL para formar la URL completa
        guard let url = URL(string: "\(mealsBaseURL)\(category)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let apiResponse = try JSONDecoder().decode(MealResponse.self, from: data)
        return apiResponse.meals
    }
}

struct APIResponse: Decodable {
    let categories: [Category]
}

struct MealResponse: Decodable{
    let meals: [Meal]
}
