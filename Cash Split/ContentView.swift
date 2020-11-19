//
//  ContentView.swift
//  Cash Split
//
//  Created by Wissa Michael on 18.11.20.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeopleIndex = 2
	@State private var tipPercentageIndex = 2
	private var tipPercentages = [0, 10, 15, 20, 25]
	
	var totalPerPerson: Double {
		let amount = Double(checkAmount) ?? 0
		let numberOfPeople = Double(numberOfPeopleIndex + 2)
		let tipPercentage = Double(tipPercentages[tipPercentageIndex])
		
		let totalAmount = amount + amount / 100 * tipPercentage
		let grandTotalPerPerson = totalAmount / numberOfPeople
		
		return grandTotalPerPerson
	}
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Enter the amount to split", text: $checkAmount)
						.keyboardType(.decimalPad)
					
					Picker("Number of People", selection: $numberOfPeopleIndex) {
						ForEach(2 ..< 50) {
							Text("\($0) People")
						}
					}
				}
				
				Section(header: Text("How much Tip do you want to leave?")) {
					Picker("Tip", selection: $tipPercentageIndex) {
						ForEach(0 ..< tipPercentages.count) {
							Text("\(tipPercentages[$0])%")
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				
				Section {
					Text("Each will pay: $ \(totalPerPerson, specifier: "%.2f")")
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
