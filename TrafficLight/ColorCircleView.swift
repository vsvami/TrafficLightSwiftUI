//
//  LightView.swift
//  TrafficLight
//
//  Created by Vladimir Dmitriev on 16.04.24.
//

import SwiftUI

struct ColorCircleView: View {

    let color: Color
    let opacity: Double

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 150)
                .foregroundStyle(color)
                .opacity(opacity)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
        }
    }
}

#Preview {
    ColorCircleView(color: .red, opacity: 0.3)
}
