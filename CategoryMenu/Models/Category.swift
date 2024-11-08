//
//  Category.swift
//  CategoryMenu
//
//  Created by Luis Alfredo Saavedra Falcon on 8/11/24.
//


import SwiftUI

// Modelo de datos de la categoría
struct Category: Identifiable, Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    var id: String { idCategory }    
}


