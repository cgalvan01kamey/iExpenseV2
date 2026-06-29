//
//  ContentView.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 6/27/26.
//

import SwiftUI
struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Welcome \(name)")
            .font(.largeTitle)
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State var showingSheet = false
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Carlos")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
