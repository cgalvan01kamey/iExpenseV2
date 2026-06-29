//
//  ContentView.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 6/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers: [Int] = []
    @State private var currentNumber = 1
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {number in
                        Text("Row \(number)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
            .padding()
        }
    }
    
    private func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
