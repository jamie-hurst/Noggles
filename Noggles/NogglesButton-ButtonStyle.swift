//
//  NounsButton-ButtonStyle.swift
//  Noggles
//
//  Created by Jameson Hurst on 11/24/22.
//

import SwiftUI

struct NogglesButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 150, height: 150)
            .background(.nounsYellow)
            .cornerRadius(30)
            .shadow(color: .black, radius: 0, x: (configuration.isPressed ? 0 : 8), y: (configuration.isPressed ? 0 : 8))
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(.black, lineWidth: 4)
            )
            .offset(x: (configuration.isPressed ? 8 : 0), y: (configuration.isPressed ? 8 : 0))
    }
}
