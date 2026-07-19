//
//  AddView.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 7/4/26.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = ExpenseType.personal
    @State private var amount = 0.0
    @State private var showingErrorMessage = false
    
    private var userCurrency: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases, id: \.self) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: userCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        guard !name.isEmpty, amount >= 0 else {
                            showingErrorMessage = true
                            return
                        }
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert("We couldn't save your expense", isPresented: $showingErrorMessage) {
                Button("OK") { }
            } message: {
                Text("Please fill in all the fields or enter a valid amount.")
                    .foregroundStyle(.red)
            }
        }
    }
}
