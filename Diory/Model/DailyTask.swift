//
//  DailyTask.swift
//  Diory
//
//  Created by Anjin on 4/15/24.
//

import SwiftUI

struct DailyTask: Identifiable {
    var id = UUID()
    var date: Date
    var schedules: [Schedule]
    var todos: [Todo]
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
        Schedule(title: "아카데미", startTime: "2024.04.18 14:00".changeToDateWithTime(), finishTime: "2024.04.18 18:13".changeToDateWithTime(), place: "Collab 3"),
        Schedule(title: "구떠리 회의", startTime: "2024.04.16 21:30".changeToDateWithTime(), finishTime: "2024.04.16 23:00".changeToDateWithTime(), place: "비대면")]
    
    static let dummy5: [Schedule] = [
        Schedule(title: "아카데미", startTime: "2024.04.17 14:00".changeToDateWithTime(), finishTime: "2024.04.17 18:13".changeToDateWithTime(), place: "Collab 3"),
        Schedule(title: "구떠리 회의", startTime: "2024.04.17 21:30".changeToDateWithTime(), finishTime: "2024.04.17 23:00".changeToDateWithTime(), place: "비대면")]
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
