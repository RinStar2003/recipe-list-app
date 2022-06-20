import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    
    var body: some View {
        
       ScrollView {
        
           VStack (alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image).resizable()
                   .scaledToFill().cornerRadius(20)
                    
               Text(recipe.name).bold().padding(.leading).padding(.top, 20).font(Font.custom("Avenir Heavy", size: 25))
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                Text("Select your serving size").font(Font.custom("Avenir", size: 16))
                Picker("Serving Size", selection: $selectedServingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width:160).shadow(color: .black, radius: 0.1).font(Font.custom("Avenir", size: 16))
                
                }.padding()
               Divider()
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .padding(.horizontal, 1.0).font(Font.custom("Avenir", size: 16))
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5).font(Font.custom("Avenir", size: 16))
                    }
                }
                .padding(.horizontal)
            }
            
       }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
