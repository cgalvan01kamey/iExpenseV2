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
    var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    
    var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        if let personalSavedItems = UserDefaults.standard.data(forKey: "PersonalItems"),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: personalSavedItems) {
            personalItems = decodedItems
        }
        
        if let businessSavedItems = UserDefaults.standard.data(forKey: "BusinessItems"),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: businessSavedItems) {
            businessItems = decodedItems
        }
    }
}
