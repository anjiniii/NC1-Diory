//
//  DailyTask.swift
//  Diory
//
//  Created by Anjin on 4/15/24.
//

import SwiftData
import SwiftUI

//@Model
//final class DailyTask {
//    @Attribute(.unique) var date: Date
//    
//    @Relationship(deleteRule: .cascade) var schedules: [Schedule]
//    @Relationship(deleteRule: .cascade) var todos: [Todo]
//    
//    init(date: Date, schedules: [Schedule], todos: [Todo]) {
//        self.date = date
//        self.schedules = schedules
//        self.todos = todos
//    }
//}
//
//@Model
//final class Schedule: Identifiable, Hashable {
//    let id = UUID()
//    var title: String
//    var startTime: Date
//    var finishTime: Date?
//    var place: String
//    
//    init(title: String, startTime: Date, finishTime: Date? = nil, place: String) {
//        self.title = title
//        self.startTime = startTime
//        self.finishTime = finishTime
//        self.place = place
//    }
//}
//
//@Model
//final class Todo: Identifiable {
//    let id = UUID()
//    var title: String
//    var isAchieved: Bool
//    var date: Date
//    var color: Color
//    var subTodos: [SubTodo]
//    
//    init(title: String, isAchieved: Bool, date: Date, color: Color, subTodos: [SubTodo]) {
//        self.title = title
//        self.isAchieved = isAchieved
//        self.date = date
//        self.color = color
//        self.subTodos = subTodos
//    }
//}
//
//@Model
//final class SubTodo: Identifiable {
//    let id = UUID()
//    var title: String
//    var isAchieved: Bool
//    
//    init(title: String, isAchieved: Bool) {
//        self.title = title
//        self.isAchieved = isAchieved
//    }
//}

struct DailyTask {
    @Attribute(.unique) var date: Date
    
    @Relationship(deleteRule: .cascade) var schedules: [Schedule]
    @Relationship(deleteRule: .cascade) var todos: [Todo]
}

struct Schedule: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var startTime: Date
    var finishTime: Date?
    var place: String
}

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isAchieved: Bool
    var date: Date
    var color: Color
    var subTodos: [SubTodo]
}

struct SubTodo: Identifiable {
    let id = UUID()
    var title: String
    var isAchieved: Bool
}

// 더미 데이터
extension DailyTask {
    static let dummy: DailyTask = DailyTask(date: Date(), schedules: Schedule.dummy4, todos: Todo.dummy2)
}

extension Schedule {
    static let dummy0: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.14 14:00".changeToDateWithTime(), finishTime: "2024.04.14 18:13".changeToDateWithTime(), place: "Collab 3"),
        Schedule(title: "구떠리 회의", startTime: "2024.04.14 21:30".changeToDateWithTime(), finishTime: "2024.04.14 23:00".changeToDateWithTime(), place: "비대면")]
    
    static let dummy3: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.17 14:00".changeToDateWithTime(), finishTime: "2024.04.15 18:13".changeToDateWithTime(), place: "Collab 3")]
    
    static let dummy4: [Schedule] = [
        Schedule(title: "이오의 이오이오", startTime: "2024.04.16 09:00".changeToDateWithTime(), finishTime: nil, place: "도서관 GSR-I"),
        Schedule(title: "아카데미", startTime: "2024.04.18 14:00".changeToDateWithTime(), finishTime: "2024.04.18 18:00".changeToDateWithTime(), place: "Collab 3"),
        Schedule(title: "구떠리 회의", startTime: "2024.04.16 21:30".changeToDateWithTime(), finishTime: "2024.04.18 23:58".changeToDateWithTime(), place: "비대면")]
    
    static let dummy5: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.17 14:00".changeToDateWithTime(), finishTime: "2024.04.17 18:13".changeToDateWithTime(), place: "Collab 3"),
        Schedule(title: "구떠리 회의", startTime: "2024.04.17 21:30".changeToDateWithTime(), finishTime: "2024.04.17 23:00".changeToDateWithTime(), place: "비대면")]
    
    static let dummy15: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.15 14:00".changeToDateWithTime(), finishTime: "2024.04.15 18:00".changeToDateWithTime(), place: "Main Lab")]
    
    static let dummy16: [Schedule] = [
        Schedule(title: "이오의 이오이오", startTime: "2024.04.16 09:00".changeToDateWithTime(), finishTime: nil, place: "C5"),
        Schedule(title: "아카데미", startTime: "2024.04.16 14:00".changeToDateWithTime(), finishTime: "2024.04.16 18:00".changeToDateWithTime(), place: "Main Lab"),
        Schedule(title: "구떠리", startTime: "2024.04.16 21:30".changeToDateWithTime(), finishTime: "2024.04.16 23:00".changeToDateWithTime(), place: "비대면")]
    
    static let dummy17: [Schedule] = [
        Schedule(title: "러닝", startTime: "2024.04.17 07:50".changeToDateWithTime(), finishTime: nil, place: "포스빌"),
        Schedule(title: "아카데미", startTime: "2024.04.17 14:00".changeToDateWithTime(), finishTime: "2024.04.17 18:00".changeToDateWithTime(), place: "Main Lab")]
    
    static let dummy18: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.18 14:00".changeToDateWithTime(), finishTime: "2024.04.18 18:00".changeToDateWithTime(), place: "Main Lab"),
        Schedule(title: "Accessibility 스터디", startTime: "2024.04.18 18:00".changeToDateWithTime(), finishTime: "2024.04.18 19:00".changeToDateWithTime(), place: "Collab")]
    
    static let dummy19: [Schedule] = [
        Schedule(title: "이오의 이오이오", startTime: "2024.04.19 09:00".changeToDateWithTime(), finishTime: nil, place: "C5"),
        Schedule(title: "아카데미", startTime: "2024.04.19 14:00".changeToDateWithTime(), finishTime: "2024.04.19 18:00".changeToDateWithTime(), place: "Main Lab")]
    
    static let dummy20: [Schedule] = [
        Schedule(title: "서울 버스", startTime: "2024.04.20 09:00".changeToDateWithTime(), finishTime: nil, place: "포항시청"),
        Schedule(title: "구떠리 회의", startTime: "2024.04.20 13:00".changeToDateWithTime(), finishTime: "2024.04.20 18:00".changeToDateWithTime(), place: "여의도")]
    
    static let dummy21: [Schedule] = []
    
    static let dummy22: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.22 14:00".changeToDateWithTime(), finishTime: "2024.04.22 18:00".changeToDateWithTime(), place: "Main Lab")]
    
    static let dummy23: [Schedule] = [
        Schedule(title: "이오의 이오이오", startTime: "2024.04.23 09:00".changeToDateWithTime(), finishTime: nil, place: "C5"),
        Schedule(title: "아카데미", startTime: "2024.04.23 14:00".changeToDateWithTime(), finishTime: "2024.04.23 18:00".changeToDateWithTime(), place: "Main Lab")]
    
    static let dummy24: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.24 14:00".changeToDateWithTime(), finishTime: "2024.04.24 18:00".changeToDateWithTime(), place: "Main Lab")]
    
    static let dummy25: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.25 14:00".changeToDateWithTime(), finishTime: "2024.04.25 18:00".changeToDateWithTime(), place: "Main Lab"),
        Schedule(title: "Accessibility 스터디", startTime: "2024.04.25 18:00".changeToDateWithTime(), finishTime: "2024.04.25".changeToDate(), place: "Collab")]
    
    static let dummy26: [Schedule] = [
        Schedule(title: "이오의 이오이오", startTime: "2024.04.19 09:00".changeToDateWithTime(), finishTime: nil, place: "C5"),
        Schedule(title: "아카데미", startTime: "2024.04.26 14:00".changeToDateWithTime(), finishTime: "2024.04.26 18:00".changeToDateWithTime(), place: "Main Lab")]
    
    static let dummy27: [Schedule] = []
    
    static let dummy28: [Schedule] = []
}

extension Todo {
    static let dummy2: [Todo] = [
        Todo(title: "마디", isAchieved: false, date: Date(), color: Color.yellow, subTodos: [
            SubTodo(title: "task 이슈로 전부 생성해두기", isAchieved: true),
            SubTodo(title: "v1.0.2 반영 사항 확인하기", isAchieved: false)]),
        Todo(title: "아카데미", isAchieved: false, date: Date(), color: Color.indigo, subTodos: [
            SubTodo(title: "NC1 다이오리 화면 개발", isAchieved: true),
            SubTodo(title: "필요한 기능 공부하기", isAchieved: false),
            SubTodo(title: "MusicKit 알아보기", isAchieved: false)])]
}
