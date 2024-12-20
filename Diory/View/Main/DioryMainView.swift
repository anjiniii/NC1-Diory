//
//  DioryMainView.swift
//  Diory
//
//  Created by Anjin on 12/20/24.
//

import SwiftUI

struct DioryMainView: View {
    @State private var pageIndex: Int?
    
    var body: some View {
        ZStack {
            DioryTabView(pageIndex: $pageIndex)
            
            VStack {
                Spacer()
                
                TabIndex(pageIndex: $pageIndex)
                    .frame(width: 52)
            }
        }
        .onAppear {
            pageIndex = 1
        }
    }
}
