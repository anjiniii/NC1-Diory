//
//  DioryTabView.swift
//  Diory
//
//  Created by Anjin on 4/18/24.
//

import SwiftUI

struct DioryTabView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                NavigationStack {
                    WeeklyView()
                }
                .ignoresSafeArea()
                .containerRelativeFrame(.horizontal)
                
                NavigationStack {
                    DailyView()
                }
                .ignoresSafeArea()
                .containerRelativeFrame(.horizontal)
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.never)
        .ignoresSafeArea()
    }
}
