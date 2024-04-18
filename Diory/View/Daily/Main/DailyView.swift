//
//  DailyView.swift
//  Diory
//
//  Created by Anjin on 4/14/24.
//

import SwiftUI

struct DailyView: View {
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker: Bool = false
    @State private var task: DailyTask = DailyTask.dummy
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    DailyScheduleView(schedules: task.schedules)
                    
                    DailyTodoView(todos: task.todos)
                        .padding(.bottom, 20)
                }
                .padding(20)
            }
            .refreshable {
                print("wow")
            }
            
            if showDatePicker {
                Color.black.opacity(0.8).ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showDatePicker = false
                        }
                    }
                    .ignoresSafeArea()
                
                DatePicker(selection: $selectedDate, displayedComponents: .date) {
                    Image(systemName: "calendar")
                }
                .datePickerStyle(.graphical)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .offset(y: 0)
                .onChange(of: selectedDate) { _, _ in
                    showDatePicker = false
                }
            }
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
        .navigationTitle(navigationTitleString())
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) { calendarButton }
        }
    }
    
    private var calendarButton: some View {
        Button {
            showDatePicker.toggle()
        } label: {
            Image(systemName: "calendar")
        }
    }
    
    private func navigationTitleString() -> String {
        "\(selectedDate.year).\(selectedDate.month).\(selectedDate.day).\(selectedDate.weekday)"
    }
}

extension Date {
    var weekday: String {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)

        // 요일을 출력합니다.
        switch weekday {
        case 1: return "일요일"
        case 2: return "월요일"
        case 3: return "화요일"
        case 4: return "수요일"
        case 5: return "목요일"
        case 6: return "금요일"
        case 7: return "토요일"
        default: return "일용용"
        }
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var month: String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        return "\(month)"
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" // "yyyy"는 4자리 연도를 나타내는 포맷입니다
        return dateFormatter.string(from: self)
    }
    
    func isSameDay(as date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}

#Preview {
    DailyView()
}
