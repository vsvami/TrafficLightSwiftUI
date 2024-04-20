//
//  ContentView.swift
//  TrafficLight
//
//  Created by Vladimir Dmitriev on 16.04.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLight: CurrentLight = .off
    @State private var buttonTitle = "Start"
    
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    ColorCircleView(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                    ColorCircleView(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                    ColorCircleView(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                }
                Spacer()
                
                StartButtonView(title: buttonTitle) {
                    if buttonTitle == "Start" {
                        buttonTitle = "Next"
                    }
                    nextColor()
                }
            }
            .padding(.bottom, 50)
        }
    }
    
    private func nextColor() {
        switch currentLight {
        case .off: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

//MARK: - CurrentLight
private extension ContentView {
    enum CurrentLight {
        case off, red, yellow, green
    }
}

#Preview {
    ContentView()
}
