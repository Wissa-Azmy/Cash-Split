//
//  ContentView.swift
//  Cash Split
//
//  Created by Wissa Michael on 18.11.20.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople = ""
	@State private var tipPercentageIndex = 2
	private var tipPercentages = [0, 10, 15, 20, 25]
	
	var totalAmount: Double {
		let amount = Double(checkAmount) ?? 0
		let tipPercentage = Double(tipPercentages[tipPercentageIndex])
		
		return (amount + amount / 100 * tipPercentage)
	}
	
	var totalPerPerson: Double {
		let grandTotalPerPerson = totalAmount / (Double(numberOfPeople) ?? 1)
		
		return grandTotalPerPerson
	}
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Enter the amount to split", text: $checkAmount)
						.keyboardType(.decimalPad)
					
					TextField("Number of People", text: $numberOfPeople)
				}
				
				Section(header: Text("How much Tip do you want to leave?")) {
					Picker("Tip", selection: $tipPercentageIndex) {
						ForEach(0 ..< tipPercentages.count) {
							Text("\(tipPercentages[$0])%")
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				
				Section(header: Text("Amounts")) {
					Text("Total: $ \(totalAmount, specifier: "%.2f")")
					Text("Per person: $ \(totalPerPerson, specifier: "%.2f")")
				}
			}
			.navigationTitle("Cash Split")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
