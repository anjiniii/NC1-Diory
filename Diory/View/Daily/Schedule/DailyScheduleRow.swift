//
//  DailyScheduleRow.swift
//  Diory
//
//  Created by Anjin on 4/16/24.
//

import SwiftUI

struct DailyScheduleRow: View {
    let schedule: Schedule
    let isFirst: Bool
    let isLast: Bool
    
    var body: some View {
        HStack {
            // 스케쥴 시간
            HStack {
                Spacer(minLength: 0)
                
                Text(scheduleTimeString(schedule))
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            .frame(width: 100)
            
            // 가운데 동그라미 + 세로 선
            GeometryReader { geo in
                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .frame(width: 1, height: geo.size.height / 2)
                            .foregroundStyle(isFirst ? Color.clear : Color.secondary)
                        
                        Rectangle()
                            .frame(width: 1, height: geo.size.height / 2)
                            .foregroundStyle(isLast ? Color.clear : Color.secondary)
                    }
                    
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(isNow(schedule: schedule) ? Color.dioryPurple : Color.white)
                        .overlay {
                            Circle()
                                .stroke(Color.dioryPurple, lineWidth: 2)
                        }
                }
            }
            .frame(width: 12)
            
            // 스케쥴 정보 박스
            VStack(alignment: .leading, spacing: 2) {
                // 스케쥴 이름
                Text(schedule.title)
                    .font(.title3).bold()
                    .foregroundStyle(isNow(schedule: schedule) ? Color.white : Color.primary.opacity(0.9))
                
                // 스케쥴 장소
                Text(schedule.place)
                    .font(.footnote)
                    .foregroundStyle(isNow(schedule: schedule) ? Color.white : Color.secondary)
                
                HStack { Spacer() }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background { backgroundGradient(schedule: schedule) }
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .padding(.vertical, 6)
        }
    }
    
    private func scheduleTimeString(_ schedule: Schedule) -> String {
        if let finishTime = schedule.finishTime {
            return "\(getTime(schedule.startTime)) - \(getTime(finishTime))"
        } else {
            return "\(getTime(schedule.startTime))"
        }
    }
    
    private func getTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: date)
        return timeString
    }
    
    private func isNow(schedule: Schedule) -> Bool {
        let now = Date()
        
        let startTime = schedule.startTime
        let finishTime = schedule.finishTime
        
        return now >= startTime && now <= (finishTime ?? startTime)
    }
    
    private func backgroundGradient(schedule: Schedule) -> LinearGradient {
        let isNow = self.isNow(schedule: schedule)
        let startColor = isNow ? Color(red: 0.68, green: 0.63, blue: 0.95) : Color.white
        let endColor = isNow ? Color(red: 0.51, green: 0.43, blue: 0.95) : Color.white
        
        return LinearGradient(
            stops: [
                Gradient.Stop(color: startColor, location: 0.00),
                Gradient.Stop(color: endColor, location: 1.00)
            ],
            startPoint: UnitPoint(x: 0, y: 0),
            endPoint: UnitPoint(x: 1, y: 1)
        )
    }
}
