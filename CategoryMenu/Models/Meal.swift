//
//  Meal.swift
//  CategoryMenu
//
//  Created by Luis Alfredo Saavedra Falcon on 8/11/24.
//

import SwiftUI
// Modelo de datos de las recetas
struct Meal: Identifiable,Decodable{
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    var id: String {idMeal}
}
