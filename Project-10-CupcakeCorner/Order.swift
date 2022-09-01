//
//  Order.swift
//  Project-10-CupcakeCorner
//
//  Created by Luca Capriati on 2022/08/31.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, addExtraFrosting, addExtraSprinkles, name, streetAddress, city, zip
    }
    
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
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cake cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if addExtraFrosting {
            cost += Double(quantity)
        }
        
        // $0.5-/cake for extra sprinkles
        if addExtraSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(addExtraFrosting, forKey: .addExtraFrosting)
        try container.encode(addExtraSprinkles, forKey: .addExtraSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        addExtraFrosting = try container.decode(Bool.self, forKey: .addExtraFrosting)
        addExtraSprinkles = try container.decode(Bool.self, forKey: .addExtraSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
}
