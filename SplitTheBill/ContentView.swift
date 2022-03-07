//
//  ContentView.swift
//  SplitTheBill
//
//  Created by Jannatun Nahar Papia  on 7/3/22.
//

import SwiftUI

struct ContentView: View {
    
    //Add variable
    @State private var totalCost = ""
    @State private var people = 4
    @State private var tipIndex = 2
    let tipPercentages = [0, 5, 10, 15]
    
    // Create a function
    func calculateTotal() -> Double {
        let tip = Double(tipPercentages[tipIndex])
        let orderTotal = Double(totalCost) ?? 0
        let finalAmount = ((orderTotal / 100 * tip) + orderTotal)
        return finalAmount / Double(people)
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
