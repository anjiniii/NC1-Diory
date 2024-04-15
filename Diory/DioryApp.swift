//
//  DioryApp.swift
//  Diory
//
//  Created by Anjin on 4/14/24.
//

import SwiftUI

@main
struct DioryApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                DailyView()
            }
        }
    }
}

/*
 
 TabView {
     WeeklyView()
         .tabItem { Text("weekly") }
     
     WeeklyView()
         .tabItem { Text("daily") }
 }
 .background(Color(red: 0.95, green: 0.95, blue: 0.97))
 .tabViewStyle(.page(indexDisplayMode: .always))
 .indexViewStyle(.page(backgroundDisplayMode: .automatic))
 
 */
