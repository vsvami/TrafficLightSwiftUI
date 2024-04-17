//
//  ContentView.swift
//  TrafficLight
//
//  Created by Vladimir Dmitriev on 16.04.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLight = CurrentLight.red
    @State private var nameButton = "Start"
    
    @State private var opacityRed = 0.3
    @State private var opacityYellow = 0.3
    @State private var opacityGreen = 0.3
    
    private let lightIsOff = 0.3
    private let lightIsOn = 1.0

    var body: some View {
        VStack {
            VStack {
                LightView(color: .red)
                    .opacity(opacityRed)
                LightView(color: .yellow)
                    .opacity(opacityYellow)
                LightView(color: .green)
                    .opacity(opacityGreen)
            }
            Spacer()
            Button(action: buttonTapped) {
                Text(nameButton)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding(.bottom, 50)
    }
    
    private func buttonTapped() {
        if nameButton == "Start" {
            nameButton = "Next"
        }
        
        switch currentLight {
        case .red:
            opacityGreen = lightIsOff
            opacityRed = lightIsOn
            currentLight = .yellow
        case .yellow:
            opacityRed = lightIsOff
            opacityYellow = lightIsOn
            currentLight = .green
        case .green:
            opacityYellow = lightIsOff
            opacityGreen = lightIsOn
            currentLight = .red
        }
    }
}

//MARK: - CurrentLight
extension ContentView {
    enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
