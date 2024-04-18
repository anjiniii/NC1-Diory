//
//  WeeklyRow.swift
//  Diory
//
//  Created by Anjin on 4/17/24.
//

import SwiftUI

struct WeeklyRow: View {
    let date: Date
    let schedule: String
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Text("\(date.day)")
                    .font(.title2)
                    .foregroundStyle(dateColor())
                    .frame(width: 32)
                
                Text(date.weekday.prefix(1))
                    .font(.subheadline)
                    .foregroundStyle(Color.indigo)
                    .frame(width: 20)
            }
            .padding(.trailing, 12)
            
            Text(schedule)
                .font(.body)
        }
    }
    
    private func dateColor() -> Color {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        if weekday == 7 {
            return Color.indigo
        } else if weekday == 1 {
            return Color.red
        } else {
            return Color.primary
        }
    }
}
