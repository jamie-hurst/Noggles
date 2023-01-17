//
//  Extensions.swift
//  Noggles
//
//  Created by Jameson Hurst on 11/20/22.
//

import SwiftUI 

// Custom colors
extension ShapeStyle where Self == Color {
    
    static var nounsYellow: Color {
        Color(red: 0.9372549019607843, green: 0.788235294117647, blue: 0.3137254901960784)
    }
    
    static var nounsLightYellow: Color {
        Color(red: 0.9450980392156862, green: 0.807843137254902, blue: 0.3843137254901961)
    }

    static var nounsRed: Color {
        Color(red: 0.9529411764705882, green: 0.19607843137254902, blue: 0.17254901960784313)
    }
}

// Device shake
// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShake(action: action))
    }
}
