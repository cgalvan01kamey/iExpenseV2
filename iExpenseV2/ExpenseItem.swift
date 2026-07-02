//
//  ExpenseItem.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 7/2/26.
//

import Foundation

enum ExpenseType: String {
    case business = "Business"
    case personal = "Personal"
}

struct ExpenseItem {
    let name: String
    let type: ExpenseType
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}
