//
//  CategoryCardView.swift
//  CategoryMenu
//
//  Created by Luis Alfredo Saavedra Falcon on 7/11/24.
//

import SwiftUI

struct CategoryCardView: View {
    let category: Category

    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            } placeholder: {
                ProgressView()
            }
            Spacer() 
            Text(category.strCategory)
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding(.top, 8)
            Spacer() // Añade espacio entre el texto y la flecha

            // Flecha a la derecha
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.system(size: 30))
           
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
