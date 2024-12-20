//
//  StringToDate.swift
//  Diory
//
//  Created by Anjin on 4/16/24.
//

import SwiftUI

extension String {
    func changeToDateWithTime() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd HH:mm"
        
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return Date()
        }
    }
}
