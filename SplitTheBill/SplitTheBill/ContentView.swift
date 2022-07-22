//
//  ContentView.swift
//  SplitTheBill
//
//  Created by Ujjwal Rawat on 22/07/22.
//

import SwiftUI

struct ContentView: View {
    
@State private var totalCost = ""
@State private var people = 4
@State private var tipIndex = 2
    let tipPercentages = [0, 5, 10, 15]
    
    func calculateTotal() -> Double {
        let tip = Double(tipPercentages[tipIndex])
        let orderTotal = Double(totalCost) ?? 0
        let finalAmount = ((orderTotal / 100 * tip) + orderTotal)
    return finalAmount / Double(people)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.gray.opacity(0.28)]), startPoint: .top, endPoint: .bottom)
            LinearGradient(gradient: Gradient(colors: [Color.purple,Color.pink.opacity(0.28)]), startPoint: .top, endPoint: .bottom)
            Text(" 'Split the bill and Make it equal' ")
                .font(.largeTitle)
                .italic()
                .foregroundColor(.black)
                .bold().underline()
                .font(.system(size: 54 ))
                .padding()
            
        }
        
        .edgesIgnoringSafeArea(.vertical)
        .ignoresSafeArea(.all, edges: .horizontal)
        .background(Color.purple.ignoresSafeArea())
        .padding()
        
        NavigationView {
            Form{
                Section(header:Text ("Enter an amount")) {
                    TextField("Amount", text: $totalCost).keyboardType(.decimalPad)
                }
                Section(header: Text("Select a tip amount (%)")) {
                    Picker("Tip percentage", selection: $tipIndex){
                        ForEach(0 ..< tipPercentages.count)
                        {
                            Text("\(tipPercentages[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                Section(header: Text("How many people?")) {
                    Picker("Number of people", selection: $people) {
                        ForEach(0 ..< 50) {
                            Text("\($0) PEOPLE")
                        }
                    }
                };Section(header: Text("Total per person")) {
                    Text("₹ \(calculateTotal(), specifier:"%.2f")")
                }
            }.navigationTitle("Gandhi-Money")
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

