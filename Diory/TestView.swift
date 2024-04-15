//
//  TestView.swift
//  Diory
//
//  Created by Anjin on 4/15/24.
//

import SwiftUI

struct TestView: View {
    private let emojies = ["🎁", "🛍️", "📚", "🚨"]
    @State private var selectedEmoji = "🎁"
    
    var body: some View {
        List {
            Text("11")
            Text("22")
            Picker("picker", selection: $selectedEmoji) {
                ForEach(emojies, id: \.self) { emoji in
                    Button {
                        selectedEmoji = emoji
                    } label: {
                        Text(emoji)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    TestView()
}
