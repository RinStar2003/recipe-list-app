//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by mас on 21.09.2021.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var IsDetailViewShowing = false
    @State var tabSelectionIndex = 0
    

    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 0) {
            Text("Featured Recepies").bold().padding(.leading).padding(.top, 40).font(Font.custom("Avenir Heavy", size: 29))
            
        GeometryReader { geo in
            TabView(selection: $tabSelectionIndex) {
                
                ForEach (0..<model.recipes.count) { i in
                        
                        if model.recipes[i].featured == true {
                            Button(action:{
                                
                                self.IsDetailViewShowing = true
                                
                                
                                
                                
                            }, label: {
                                ZStack {
                                Rectangle().foregroundColor(.white)
                                    
                                    
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[i].image).resizable().clipped().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        Text(model.recipes[i].name).padding(5).font(Font.custom("Avenir Heavy", size: 16))
                                        
                                    }
                                    
                                }
                            }).tag(i)
                            .sheet(isPresented: $IsDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[i])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue:  0, opacity: 0.6), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 5)
                        }
            
                }
               
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:").font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime).font(Font.custom("Avenir", size: 16))
                Text("Highlights:").font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights).font(Font.custom("Avenir", size: 16))
            }
            .padding(.leading, 30)
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    func setFeaturedIndex() {
        
        // Find the index of first recipe that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}

