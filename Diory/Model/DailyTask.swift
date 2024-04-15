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

extension DailyTask {
    static let dummy: DailyTask = DailyTask(date: Date(), schedules: Schedule.dummy3, todos: Todo.dummy2)
}

struct Schedule {
    var title: String
    var startTime: Date
    var finishTime: Date?
    var place: String
}

extension Schedule {
    static let dummy3: [Schedule] = [
        Schedule(title: "이오의 이오이오", startTime: Date(), finishTime: Date(), place: "도서관 GSR-I"),
        Schedule(title: "피콜로 스터디", startTime: Date(), finishTime: Date(), place: "Collab 3"),
        Schedule(title: "구떠리 회의", startTime: Date(), finishTime: Date(), place: "비대면")]
}

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isAchieved: Bool
    var date: Date
    var color: Color
    var subTodos: [SubTodo]
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

struct SubTodo: Identifiable {
    let id = UUID()
    var title: String
    var isAchieved: Bool
}

/*
 // 입력된 문자열 형식을 나타내는 DateFormatter를 생성합니다.
 let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "yyyy.MM.dd"

 // 문자열을 Date로 변환합니다.
 if let date = dateFormatter.date(from: "2024.04.12") {
     print("변환된 날짜: \(date)")
 */
