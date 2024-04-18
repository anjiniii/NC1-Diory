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
        for addValue in 0 ..< 14 {
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
    static let allDummyDateComponents: [DateComponents: DailyTask] = [
        "2024.04.14".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.15".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.16".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.17".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.18".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.19".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.20".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.21".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.22".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.23".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.24".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.25".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.26".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.27".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.28".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.29".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.30".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.05.01".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.05.02".changeToDate().changeToDateComponents(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2)
    ]
    
    static let allDummyDate: [Date: DailyTask] = [
        "2024.04.14".changeToDate(): DailyTask(schedules: Schedule.dummy0, todos: Todo.dummy2),
        "2024.04.15".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.16".changeToDate(): DailyTask(schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.04.17".changeToDate(): DailyTask(schedules: Schedule.dummy5, todos: Todo.dummy2),
        "2024.04.18".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.19".changeToDate(): DailyTask(schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.04.20".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.21".changeToDate(): DailyTask(schedules: Schedule.dummy5, todos: Todo.dummy2),
        "2024.04.22".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.23".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.24".changeToDate(): DailyTask(schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.04.25".changeToDate(): DailyTask(schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.04.26".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.04.27".changeToDate(): DailyTask(schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.04.28".changeToDate(): DailyTask(schedules: Schedule.dummy5, todos: Todo.dummy2),
        "2024.04.29".changeToDate(): DailyTask(schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.04.30".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2),
        "2024.05.01".changeToDate(): DailyTask(schedules: Schedule.dummy4, todos: Todo.dummy2),
        "2024.05.02".changeToDate(): DailyTask(schedules: Schedule.dummy3, todos: Todo.dummy2)
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
