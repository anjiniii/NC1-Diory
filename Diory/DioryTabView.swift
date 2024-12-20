//
//  DioryTabView.swift
//  Diory
//
//  Created by Anjin on 4/18/24.
//

import SwiftUI

struct DioryTabView: View {
    @Binding var pageIndex: Int?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                NavigationStack {
                    WeeklyView()
                }
                .ignoresSafeArea()
                .containerRelativeFrame(.horizontal)
                .id(0)
                
                NavigationStack {
                    DailyView()
                }
                .ignoresSafeArea()
                .containerRelativeFrame(.horizontal)
                .id(1)
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $pageIndex)
        .scrollIndicators(.never)
        .ignoresSafeArea()
    }
}
