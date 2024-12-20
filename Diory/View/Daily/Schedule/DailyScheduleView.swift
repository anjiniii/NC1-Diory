//
//  DailyScheduleView.swift
//  Diory
//
//  Created by Anjin on 4/16/24.
//

import SwiftData
import SwiftUI

struct DailyScheduleView: View {
//    @Query(sort: \Schedule.startTime) var tasks: [DailyTask]
    let schedules: [Schedule]
    @State private var showAddScheduleSheet: Bool = false
    
    /*
    init(sort: SortDescriptor<Destination>) {
        let now = Date.now
        
        _destinations = Query(filter: #Predicate {
            // 우선순위가 2 이상
            // $0.priority >= 2
            
            // 날짜가 미래인 것만
            $0.date > now
        }, sort: [sort])}
    */
    
//    init() {
//        let today = Date()
//        _schedules = Query(filter: #Predicate {
//            $0.startTime.isSameDay(as: today)
//        })
//    }
    
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
