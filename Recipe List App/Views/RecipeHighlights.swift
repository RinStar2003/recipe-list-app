//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by mас on 28.10.2021.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        
        //loop through the highlights and build the string
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
        
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test","test","test"])
    }
}
