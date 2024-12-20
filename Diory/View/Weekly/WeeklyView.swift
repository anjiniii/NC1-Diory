//
//  WeeklyView.swift
//  Diory
//
//  Created by Anjin on 4/14/24.
//

import SwiftUI

struct WeeklyView: View {
    private let allTasks = DummyData.allDummyDate
    private let today: Date = Date()
    private let task: DailyTask = DailyTask.dummy
    var dates: [Date] { getDates() }
    
    var body: some View {
        List {
            Section("This Week") {
                ForEach(0 ..< 7, id: \.self) { index in
                    let date = dates[index]
                    WeeklyRow(date: date, schedule: getSchedulesString(index: index))
                        .listRowBackground(isToday(date) ? Color.indigo.opacity(0.2) : Color.white)
                }
            }
            
            Section("Next Week") {
                ForEach(7 ..< 14, id: \.self) { index in
                    let date = dates[index]
                    
                    WeeklyRow(date: date, schedule: getSchedulesString(index: index))
                        .listRowBackground(isToday(date) ? Color.indigo.opacity(0.2) : Color.white)
                }
            }
        }
        .navigationTitle("이오의 주간 일정")
        .navigationBarTitleDisplayMode(.automatic)
    }
    
    private func getSchedulesString(index: Int) -> String {
        let schedules = allTasks[dates[index]]?.schedules ?? []
        var schedulesStringArray: [String] = []
        for schedule in schedules { schedulesStringArray.append(schedule.title) }
        return schedulesStringArray.joined(separator: ", ")
    }
    
    private func getDates() -> [Date] {
        let calendar = Calendar.current
        let startDateOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)) ?? Date()
        
        var dates: [Date] = []
        for addValue in 1 ..< 15 {
            if let date = calendar.date(byAdding: .day, value: addValue, to: startDateOfWeek) {
                dates.append(date)
            }
        }
        
        return dates
    }
    
    private func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let todayDate = calendar.dateComponents([.year, .month, .day], from: today)
        let comparedDate = calendar.dateComponents([.year, .month, .day], from: date)
        
        return todayDate == comparedDate
    }
}

#Preview {
    WeeklyView()
}

struct DummyData {
    static let allDummyDate: [Date: DailyTask] = [
        "2024.04.15".changeToDate(): DailyTask(date: "2024.04.15".changeToDate(), schedules: Schedule.dummy15, todos: Todo.dummy2),
        "2024.04.16".changeToDate(): DailyTask(date: "2024.04.16".changeToDate(), schedules: Schedule.dummy16, todos: Todo.dummy2),
        "2024.04.17".changeToDate(): DailyTask(date: "2024.04.17".changeToDate(), schedules: Schedule.dummy17, todos: Todo.dummy2),
        "2024.04.18".changeToDate(): DailyTask(date: "2024.04.18".changeToDate(), schedules: Schedule.dummy18, todos: Todo.dummy2),
        "2024.04.19".changeToDate(): DailyTask(date: "2024.04.19".changeToDate(), schedules: Schedule.dummy19, todos: Todo.dummy2),
        "2024.04.20".changeToDate(): DailyTask(date: "2024.04.20".changeToDate(), schedules: Schedule.dummy20, todos: Todo.dummy2),
        "2024.04.21".changeToDate(): DailyTask(date: "2024.04.21".changeToDate(), schedules: Schedule.dummy21, todos: Todo.dummy2),
        "2024.04.22".changeToDate(): DailyTask(date: "2024.04.22".changeToDate(), schedules: Schedule.dummy22, todos: Todo.dummy2),
        "2024.04.23".changeToDate(): DailyTask(date: "2024.04.23".changeToDate(), schedules: Schedule.dummy23, todos: Todo.dummy2),
        "2024.04.24".changeToDate(): DailyTask(date: "2024.04.24".changeToDate(), schedules: Schedule.dummy24, todos: Todo.dummy2),
        "2024.04.25".changeToDate(): DailyTask(date: "2024.04.25".changeToDate(), schedules: Schedule.dummy25, todos: Todo.dummy2),
        "2024.04.26".changeToDate(): DailyTask(date: "2024.04.26".changeToDate(), schedules: Schedule.dummy26, todos: Todo.dummy2),
        "2024.04.27".changeToDate(): DailyTask(date: "2024.04.27".changeToDate(), schedules: Schedule.dummy27, todos: Todo.dummy2),
        "2024.04.28".changeToDate(): DailyTask(date: "2024.04.28".changeToDate(), schedules: Schedule.dummy28, todos: Todo.dummy2),
        "2024.04.29".changeToDate(): DailyTask(date: "2024.04.29".changeToDate(), schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.04.30".changeToDate(): DailyTask(date: "2024.04.30".changeToDate(), schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.05.01".changeToDate(): DailyTask(date: "2024.05.01".changeToDate(), schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.05.02".changeToDate(): DailyTask(date: "2024.05.02".changeToDate(), schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.05.03".changeToDate(): DailyTask(date: "2024.04.14".changeToDate(), schedules: Schedule.dummy0, todos: Todo.dummy2)
    ]
    
    func getDateComponents(year: Int, month: Int, day: Int) -> DateComponents {
        var dateComponents = DateComponents()
        
        dateComponents.year = 2024
        dateComponents.month = 4
        dateComponents.day = 16
        
        return dateComponents
    }
}

extension Date {
    func changeToDateComponents() -> DateComponents {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        return dateComponents
    }
}

extension String {
    func changeToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return Date()
        }
    }
}
