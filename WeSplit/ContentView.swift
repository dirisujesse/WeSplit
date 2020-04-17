//
//  ContentView.swift
//  WeSplit
//
//  Created by Dirisu on 16/04/2020.
//  Copyright © 2020 Dirisu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // one way binding
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPerc = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let people = Double(numberOfPeople + 2)
        let tip = Double(tipPercentages[tipPerc])
        let amount = Double(checkAmount) ?? 0.0
        
        let tipVal = amount / 100.0 * tip
        let total = amount + tipVal
        let indAmt = total / people
        
        return indAmt
    }
    
    var body: some View {
        
        // View that take children
        // Are limited to 10 items in swiftUI
        NavigationView { // Navigation Bar Ui container
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    // adding the dollar sign before an attribute
                    // denotes 2 way bindng
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0)")
                        }
                    }
                
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPerc) {
                        ForEach(0..<tipPercentages.count) {
                            return Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle(Text("We Split"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
