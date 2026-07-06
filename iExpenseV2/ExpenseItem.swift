//
//  ExpenseItem.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 7/2/26.
//

import Foundation

enum ExpenseType: String, CaseIterable, Codable {
    case business = "Business"
    case personal = "Personal"
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
            items = decodedItems
            return
        }
        
        items = []
    }
}
