//
//  CheckoutVIew.swift
//  Project-10-CupcakeCorner
//
//  Created by Luca Capriati on 2022/08/31.
//

import SwiftUI

struct CheckoutVIew: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckoutVIew_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutVIew(order: Order())
    }
}
