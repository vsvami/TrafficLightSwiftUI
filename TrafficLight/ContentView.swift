//
//  ContentView.swift
//  TrafficLight
//
//  Created by Vladimir Dmitriev on 16.04.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLight = CurrentLight.red
    @State private var buttonTitle = "Start"
    
    @State private var redLightState = 0.3
    @State private var yellowLightState = 0.3
    @State private var greenLightState = 0.3
    
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    ColorCircleView(color: .red, opacity: redLightState)
                    ColorCircleView(color: .yellow, opacity: yellowLightState)
                    ColorCircleView(color: .green, opacity: greenLightState)
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
        let lightIsOff = 0.3
        let lightIsOn = 1.0
        
        switch currentLight {
        case .red:
            greenLightState = lightIsOff
            redLightState = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLightState = lightIsOff
            yellowLightState = lightIsOn
            currentLight = .green
        case .green:
            yellowLightState = lightIsOff
            greenLightState = lightIsOn
            currentLight = .red
        }
    }
}

//MARK: - CurrentLight
private extension ContentView {
    enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
