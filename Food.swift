//
//  Food.swift
//  MagpantayCuddyBuddy
//
//  Created by Justine Lydia Magpantay on 4/29/25.
//

import SwiftUI
import SwiftData
import Foundation

@Model
class Food: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var type: String
    var quantity: Int64 = 0
    var expirationDate: Date
    
    init( name: String, type: String, quantity: Int64, expirationDate: Date) {
        self.name = name
        self.type = type
        self.quantity = Int64(quantity)
        self.expirationDate = expirationDate
    }
    
}


