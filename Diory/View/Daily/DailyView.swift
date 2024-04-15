//
//  DailyView.swift
//  Diory
//
//  Created by Anjin on 4/14/24.
//

import SwiftUI

struct DailyView: View {
    @State private var task: DailyTask = DailyTask.dummy
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                DailyScheduleView()
                
                DailyTodoView(todos: task.todos)
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
        .navigationTitle("2024.04.15.월요일")
    }
}

struct DailyScheduleView: View {
    var body: some View {
        VStack(spacing: 20) {
            header
            
            VStack(spacing: 0) {
                ForEach(0 ..< 3, id: \.self) { index in
                    DailyScheduleRow()
                }
            }
            
            Spacer()
        }
    }
    
    var header: some View {
        VStack(spacing: 16) {
            HStack {
                Text("SCHEDULE")
                    .font(.headline)
                    .foregroundStyle(Color.secondary)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("추가")
                }
            }
            
            Divider()
        }
    }
}

struct DailyScheduleRow: View {
    var body: some View {
        HStack {
            Text("09:00 - 10:30")
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
                .padding(.vertical, 6)
            
            GeometryReader { geo in
                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .frame(width: 1, height: geo.size.height / 2)
                            .foregroundStyle(Color.secondary)
                        
                        Rectangle()
                            .frame(width: 1, height: geo.size.height / 2)
                            .foregroundStyle(Color.secondary)
                    }
                    
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(Color(red: 0.56, green: 0.54, blue: 0.87))
                }
            }
            .frame(width: 12)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("이오의 이오이오")
                    .font(.title3).bold()
                
                Text("도서관 GSR-I")
                    .font(.footnote)
                
                HStack { Spacer() }
            }
            .foregroundStyle(Color.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background {
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.68, green: 0.63, blue: 0.95), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.51, green: 0.43, blue: 0.95), location: 1.00)
                    ],
                    startPoint: UnitPoint(x: 0, y: 0),
                    endPoint: UnitPoint(x: 1, y: 1)
                )
            }
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .padding(.vertical, 6)
        }
    }
}

#Preview {
    DailyView()
}
