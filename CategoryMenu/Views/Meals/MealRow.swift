//
//  MealRow.swift
//  CategoryMenu
//
//  Created by Luis Alfredo Saavedra Falcon on 8/11/24.
//

import SwiftUI

struct MealRow: View {
    let meal: Meal

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            } placeholder: {
                ProgressView()
            }
            Text(meal.strMeal)
                .font(.title3)
                .padding(.leading)
        }
    }
}
