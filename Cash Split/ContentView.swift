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
	
	var body: some View {
		Form {
			Section {
				TextField("Enter the amount to split", text: $checkAmount)
					.keyboardType(.decimalPad)
			}
			
			Section {
				Text("$ \(checkAmount)")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
