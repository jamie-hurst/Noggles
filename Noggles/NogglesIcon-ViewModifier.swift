//
//  NogglesIcon.swift
//  Noggles
//
//  Created by Jameson Hurst on 11/22/22.
//

import SwiftUI

// Style the Noggles icons uniformly
struct NogglesIcon: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(30)
            .frame(width: 170, height: 170)
            .foregroundColor(.nounsYellow)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(.nounsRed, lineWidth: 4)
            )
    }
}
