//
//  DailyScheduleView.swift
//  Diory
//
//  Created by Anjin on 4/16/24.
//

import SwiftUI

struct DailyScheduleView: View {
    let schedules: [Schedule]
    @State private var showAddScheduleSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // 스케쥴 제목, 추가 버튼
            VStack(spacing: 16) {
                HStack {
                    Text("SCHEDULE")
                        .font(.headline)
                        .foregroundStyle(Color.secondary)
                    
                    Spacer()
                    
                    Button {
                        showAddScheduleSheet = true
                    } label: {
                        Text("추가")
                    }
                    .sheet(isPresented: $showAddScheduleSheet) {
                        AddScheduleView { _ in
                            
                        }
                    }
                }
                
                Divider()
            }
            
            // 스케쥴 row
            VStack(spacing: 0) {
                ForEach(schedules) { schedule  in
                    let isFirst = schedules.first == schedule
                    let isLast = schedules.last == schedule
                    
                    DailyScheduleRow(schedule: schedule, isFirst: isFirst, isLast: isLast)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DailyView()
}
