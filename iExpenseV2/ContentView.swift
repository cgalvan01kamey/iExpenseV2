//
//  ContentView.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 6/27/26.
//

import SwiftUI

struct ContentView: View {
    @State var count = UserDefaults.standard.integer(forKey: "TapCount")
    var body: some View {
        Button {
            withAnimation {
                count += 1
            }
            UserDefaults.standard.set(count, forKey: "TapCount")
        } label: {
            Text("Tap Count: \(count)")
                .font(.largeTitle)
        }

    }
}

#Preview {
    ContentView()
}
