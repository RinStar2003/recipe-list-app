//
//  Recipe_List_App.swift
//  Recipe List App
//
//  Created by mac on 21.09.2021.
//

import SwiftUI

@main
struct Recipe_List_App: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
                
        }
    }
}
