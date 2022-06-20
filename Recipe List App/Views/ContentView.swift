//
//  ContentView.swift
//  Recipe List App
//
//  Created by mас on 21.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    var places = ["New York", "Atlanta", "Washigton","Chicago","Detroit"]
    var food = ["Flourless Banana Bread Pancakes","Creamy Macaroni and Cheese","Cream Bundt Cake","Asparagus & Mushroom Crustless Quiche","Oven-crisp chicken wings","Easy beef & broccoli stir-fry","Belgian waffels"]
    var time = ["5 am", "6 am", "7 am", "8 am", "9 am"]
   
    
    @State var  selectedPlace = "New York"
    @State var selectedFood = "Flourless Banana Bread Pancakes"
    @State var selectedTime = "5 am"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.orange]), startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea(.all)
        
        VStack {
            Text("Ottimo Ristorante")
                .font(.title)
                .fontWeight(.heavy)
            HStack {
                Text("Location: ")
                Picker("Location:", selection: $selectedPlace) {
                ForEach(places, id: \.self) {
                        Text($0)
            }
        }.pickerStyle(MenuPickerStyle())
               
            }
            Spacer()
            ZStack(alignment:(.center)) {
            Text("Order:")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 200.0)
                
            
            Picker("Menu", selection: $selectedFood) {
            ForEach(food, id: \.self) {
                    Text($0)
        }
            }.padding(.bottom, 70.0).pickerStyle(WheelPickerStyle())
        }
            Spacer()
            ZStack(alignment:(.center)) {
            Text("Pickup time:")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 200.0)
                
            
            Picker("Menu", selection: $selectedTime) {
            ForEach(time, id: \.self) {
                    Text($0)
        }
            }.padding(.bottom, 70.0).pickerStyle(SegmentedPickerStyle())
        }
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
