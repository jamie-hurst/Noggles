//
//  DeviceShake-ViewModifer.swift
//  Noggles
//
//  Created by Jameson Hurst on 1/13/23.
//

import SwiftUI



// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShake: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}
