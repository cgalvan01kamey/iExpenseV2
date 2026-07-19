//
//  ContentView.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 6/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    private var userCurrency: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type.rawValue)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: userCurrency))
                            .foregroundStyle(getExpenseAmountStyle(expenseAmount: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
    }
    
    private func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
