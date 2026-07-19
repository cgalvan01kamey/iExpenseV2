//
//  ContentView+Helpers.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 7/18/26.
//

import SwiftUI

extension ContentView {
    public func getExpenseAmountStyle(expenseAmount: Double) -> Color {
        switch expenseAmount {
        case  ..<10:
            return .green
        case  10..<100:
            return .orange
        case 100...:
            return .red
        default:
            return .primary
        }
    }
}
