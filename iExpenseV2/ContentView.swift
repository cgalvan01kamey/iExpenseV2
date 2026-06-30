//
//  ContentView.swift
//  iExpenseV2
//
//  Created by Jose Carlos Galvan Kamey on 6/27/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    var body: some View {
        Button {
            withAnimation {
                tapCount += 1
            }
        } label: {
            Text("Tap Count: \(tapCount)")
                .font(.largeTitle)
        }

    }
}

#Preview {
    ContentView()
}
