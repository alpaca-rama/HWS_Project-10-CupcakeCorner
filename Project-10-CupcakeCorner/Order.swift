//
//  Order.swift
//  Project-10-CupcakeCorner
//
//  Created by Luca Capriati on 2022/08/31.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanialla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var addSpecialRequeset = false {
        // fixes a bug where if you enable extras and the disable request, the extras would remain.
        // ^ This fixes that.
        didSet {
            if addSpecialRequeset == false {
                addExtraFrosting = false
                addExtraSprinkles = false
            }
        }
    }
    
    @Published var addExtraFrosting = false
    @Published var addExtraSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
}
