//
//  AddTodoView.swift
//  Diory
//
//  Created by Anjin on 4/15/24.
//

import SwiftUI

struct AddTodoView: View {
    @State private var todo: Todo = Todo(title: "", isAchieved: false, date: Date(), color: Color.yellow, subTodos: [])
    var saveTodo: (Todo) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                HStack(spacing: 20) {
                    Text("TODO")
                        .font(.largeTitle).bold()
                    
                    Spacer()
                    
                    Button {
                        saveTodo(todo)
                    } label: {
                        Text("저장")
                    }
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                Section {
                    TextField("Title", text: $todo.title)
                    
                    DatePicker("Date", selection: $todo.date, displayedComponents: .date)
                    
                    ColorPicker("Color", selection: $todo.color)
                } header: {
                    Text("about")
                }
                
                Section {
                    ForEach(0 ..< todo.subTodos.count, id: \.self) { index in
                        TextField("하위 일정을 입력하세요", text: $todo.subTodos[index].title)
                    }
                    .onMove { todo.subTodos.move(fromOffsets: $0, toOffset: $1) }
                    .onDelete { todo.subTodos.remove(atOffsets: $0) }
                    
                    Button {
                        todo.subTodos.append(SubTodo(title: "", isAchieved: false))
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(Color.indigo)
                            
                            Text("하위 일정 추가하기")
                                .foregroundStyle(Color.primary)
                        }
                    }
                } header: {
                    Text("about")
                }
            }
        }
        .background {
            Color(red: 0.95, green: 0.95, blue: 0.97)
        }
    }
}

#Preview {
    AddTodoView { todo in
        print(todo)
    }
}
