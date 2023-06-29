//
//  ContentView.swift
//  WeSplit #100DaysOfSwiftUI by @TwoStraws Paul Hudson
//  Day17
//  Created by yannemal on 09/06/2023.
//

import SwiftUI

struct ContentView: View {
    // data goes here w default values incl
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
 
    
   
    // private var currencySymbol = Locale.current.currencySymbol
    @FocusState private var amountIsFocused : Bool
    //constant
    let tipPercentages = [5, 7, 10, 12, 15, 20, 25, 0]
    

    
    // computed property:
    var totalPerPerson: Double {
        // the Picker range starts counting at 2 index2 == 4 therefore
        let peopleCountCorrect = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
                    //computed property
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCountCorrect
        // print("-amount-comp[uted: \(amountPerPerson)")
        return amountPerPerson
    }
    
//    // computed property:
//    var noTip : Bool {
//        //internalise values first
//        let tipPercentageNow = tipPercentage
//        
//       if tipPercentageNow < 5 {
//          return true
//       } else {
//           return false
//       }
//   }

    // viewDidLoad in SwiftUI
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    // Text("add bill total:")
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused) // read write to the focus true false
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text(" \($0) people")
                        }
                        
                    }
                } header: {
                    Text("add 💰 amount and  👯‍♀️people paying:")
                }
                
                Section{
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much 👍🏼👍🏼  would you like to leave ?")
                }
                
                
                Section{
                    Text("Amount evenly split:")
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor((tipPercentage < 5) ? .red : .primary)
                       


                }
            }
            // modify the form
            .navigationTitle("We Split 🍕 🍔 🍺")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer() // pushes "Done" all the way to the right
                    Button("⬇️") {
                        amountIsFocused = false
                    }
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

/* weSplit app : type in the amount of the check and how many people at the table. Set a tipPErcentage. The app will calculate how much each pays when evenly split. */
