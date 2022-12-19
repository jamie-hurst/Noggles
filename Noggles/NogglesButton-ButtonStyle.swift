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
            .frame(width: 170, height: 170)
            .background(.nounsYellow)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(.black, lineWidth: 4)
            )
            .font(.largeTitle)
            .scaleEffect(configuration.isPressed ? 1.07 : 1)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
