//
//  TabIndex.swift
//  Diory
//
//  Created by Anjin on 12/20/24.
//

import SwiftUI

struct TabIndex: View {
    @Binding var pageIndex: Int?
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0 ..< 2, id: \.self) { index in
                Circle()
                    .foregroundStyle(color(at: index))
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
        .clipShape(RoundedRectangle(cornerRadius: 90))
        .shadow(color: Color.black.opacity(0.1), radius: 8)
        .padding(2)
    }
    
    private func color(at index: Int) -> Color {
        if let pageIndex, index == pageIndex {
            return Color.dioryPurple
        } else {
            return Color.white
        }
    }
}
