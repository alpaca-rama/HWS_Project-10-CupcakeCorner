//
//  ContentView.swift
//  Project-10-CupcakeCorner
//
//  Created by Luca Capriati on 2022/08/31.
//
//  Project 10 - Challange 1: Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.
//  Project 10 - Challange 2: If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, try commenting out the request.httpMethod = "POST" line in your code, which should force the request to fail.
//  Project 10 - Challange 3: If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, try commenting out the request.httpMethod = "POST" line in your code, which should force the request to fail.

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 1...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.addSpecialRequeset.animation())
                    
                    if order.addSpecialRequeset {
                        Toggle("Add extra frosting", isOn: $order.addExtraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addExtraSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
