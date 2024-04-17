//
//  LightView.swift
//  TrafficLight
//
//  Created by Vladimir Dmitriev on 16.04.24.
//

import SwiftUI

struct LightView: View {

    let color: Color

    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color)
                .frame(width: 150, height: 150)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
        }
    }
}

#Preview {
    LightView(color: .red)
}
