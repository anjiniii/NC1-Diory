//
//  WeeklyView.swift
//  Diory
//
//  Created by Anjin on 4/14/24.
//

import SwiftUI

struct WeeklyView: View {
    var body: some View {
        List {
            Section("THIS WEEK") {
                ForEach(0..<20, id: \.self) { _ in
                    Text("8")
                }
            }
            
            Section("THIS WEEK") {
                ForEach(0..<20, id: \.self) { _ in
                    Text("8")
                }
            }
        }
        .navigationTitle("이오의 주간 일정")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    WeeklyView()
}
