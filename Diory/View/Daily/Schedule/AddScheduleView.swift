//
//  AddScheduleView.swift
//  Diory
//
//  Created by Anjin on 4/16/24.
//

import SwiftUI

struct AddScheduleView: View {
    @State private var schedule: Schedule = Schedule(title: "", startTime: Date(), place: "")
    var saveSchedule: (Schedule) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                // 스케쥴 타이틀, 저장 버튼
                HStack(spacing: 20) {
                    Text("SCHEDULE")
                        .font(.largeTitle).bold()
                    
                    Spacer()
                    
                    Button {
                        saveSchedule(schedule)
                    } label: {
                        Text("저장")
                    }
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                // 정보 입력
                Section {
                    // 타이틀
                    TextField("Title", text: $schedule.title)
                    
                    // 시작 시간
                    DatePicker("Start Time", selection: $schedule.startTime, displayedComponents: [.date, .hourAndMinute])
                    
                    // 끝나는 시간
                    if let finishTime = schedule.finishTime {
                        HStack {
                            Button {
                                schedule.finishTime = nil
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundStyle(Color.red)
                            }
                            
                            DatePicker("End Time", selection: $schedule.finishTime.toUnwrapped(defaultValue: schedule.startTime), displayedComponents: [.hourAndMinute])
                        }
                    } else {
                        Button {
                            schedule.finishTime = schedule.startTime
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundStyle(Color.indigo)
    
                                Text("끝나는 시간 추가하기")
                                    .foregroundStyle(Color.primary)
                            }
                        }
                    }
                    
                    // 장소
                    TextField("place", text: $schedule.place)
                } header: {
                    Text("about")
                }
            }
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
    }
}

#Preview {
    AddScheduleView { _ in
        
    }
}

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == T? {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
