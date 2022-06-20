//
//  ContentView.swift
//  Recipe List App
//
//  Created by mac on 21.09.2021.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel 
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
            
                Text("All recipes").bold().padding(.leading).padding(.top, 40).font(Font.custom("Avenir Heavy", size: 29))
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                ForEach(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe:r),
                    label: {
                        
                        // MARK: Row item
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            VStack(alignment: .leading) {
                                
                                
                                Text(r.name).foregroundColor(.black).font(Font.custom("Avenir Heavy", size: 16))
                                RecipeHighlights(highlights: r.highlights).font(Font.custom("Avenir", size: 16))
                                
                            }
                        }
                        
                    })
                
                    }
                }
            }
                
            .navigationBarHidden(true)
                .padding(.leading)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
        .environmentObject(RecipeModel())
    }
}
