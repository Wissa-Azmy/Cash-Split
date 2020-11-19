//
//  ContentView.swift
//  Cash Split
//
//  Created by Wissa Michael on 18.11.20.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 2
	private var tipPercentages = ["0%", "10%", "15%", "20%", "25%"]
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Enter the amount to split", text: $checkAmount)
						.keyboardType(.decimalPad)
					
					Picker("Number of People", selection: $numberOfPeople) {
						ForEach(2 ..< 50) {
							Text("\($0) People")
						}
					}
				}
				
				Section(header: Text("How much Tip do you want to leave?")) {
					Picker("Tip", selection: $tipPercentage) {
						ForEach(0 ..< tipPercentages.count) {
							Text("\(tipPercentages[$0])")
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				
				Section {
					Text("Each will pay: $ \(checkAmount)")
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
