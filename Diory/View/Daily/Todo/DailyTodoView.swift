//
//  DailyTodoView.swift
//  Diory
//
//  Created by Anjin on 4/15/24.
//

import SwiftUI

struct DailyTodoView: View {
    @State var todos: [Todo] = []
    
    @State private var showAddTodoSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            header
            
            VStack(spacing: 24) {
                ForEach(0 ..< todos.count, id: \.self) { index in
                    // todo 하나
                    VStack(spacing: 12) {
                        // check box
                        HStack(spacing: 0) {
                            TodoRow(title: todos[index].title,
                                    color: todos[index].color,
                                    isAchieved: $todos[index].isAchieved)
                            
                            Spacer(minLength: 0)
                        }
                        
                        // sub todo
                        ForEach(0 ..< todos[index].subTodos.count, id: \.self) { subTodoIndex in
                            var subTodo = todos[index].subTodos[subTodoIndex]
                            HStack(spacing: 0) {
                                Spacer()
                                    .frame(width: 28)
                                
                                TodoRow(title: subTodo.title,
                                        color: todos[index].color,
                                        isAchieved: $todos[index].subTodos[subTodoIndex].isAchieved)
                                
                                Spacer(minLength: 0)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 12)
            
            Spacer()
        }
    }
    
    var header: some View {
        VStack(spacing: 16) {
            HStack(spacing: 20) {
                Text("TODO")
                    .font(.headline)
                    .foregroundStyle(Color.secondary)
                
                Spacer()
                
                Button {
//                    todos.append(Todo.dummy2[0])
                    showAddTodoSheet = true
                } label: {
                    Text("추가")
                }
                .sheet(isPresented: $showAddTodoSheet) {
                    
                }
                
                Button {
                    
                } label: {
                    Text("편집")
                }
            }
            
            Divider()
        }
    }
}

struct TodoRow: View {
    let title: String
    let color: Color
    @Binding var isAchieved: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Button {
                isAchieved.toggle()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(isAchieved ? color : Color.clear)
                        .overlay { Circle().stroke(color, lineWidth: 2) }
                    
                    if isAchieved {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(Color.white)
                    }
                }
            }
            
            Text(title)
                .foregroundStyle(isAchieved ? Color.secondary.opacity(0.7) : Color.primary)
                .overlay {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(isAchieved ? color : Color.clear)
                }
        }
    }
}

#Preview {
    DailyView()
}
