//
//  ContentView.swift
//  Cash Split
//
//  Created by Wissa Michael on 18.11.20.
//

import SwiftUI

struct ContentView: View {
	@State private var count = 0
	@State private var name = ""
	
    var body: some View {
		NavigationView {
			Form {
				Text("Add your price list here...")
					.padding()
				Section {
					Button("Tap Count \(count)") {
						self.count += 1
					}
					TextField("Enter your name", text: $name)
					Text("Your name is \(name)")
					Text("Hello, world!")
					Text("Hello, world!")
					Text("Hello, world!")
					Text("Hello, world!")
				}
				
				Group {
					Text("Hello, world!")
					Text("Hello, world!")
					Text("Hello, world!")
					Text("Hello, world!")
					Text("Hello, world!")
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
