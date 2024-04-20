//
//  StartButtonView.swift
//  TrafficLight
//
//  Created by Vladimir Dmitriev on 20.04.24.
//

import SwiftUI

struct StartButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(minWidth: 150, minHeight: 50)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 4)
        )
    }
}

#Preview {
    StartButtonView(title: "Start", action: {})
}
