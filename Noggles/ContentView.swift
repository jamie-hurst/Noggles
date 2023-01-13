//
//  ContentView.swift
//  Noggles
//
//  Created by Jameson Hurst on 11/20/22.
//

import SwiftUI
import CoreHaptics


struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var buttonText = "⌐◨-◨"
    @State private var engine: CHHapticEngine?
    
    private let pasteboard = UIPasteboard.general
    private let noggles = ["⌐◨-◨", "◧-◧¬", "⌐◧-◧", "⌐🄶-🄼", "⌐⁞⁚⁞-⁞⁚⁞", "⌐◫-◫", "⌐◪-◪", "⌐◮-◮", "⌐♥-♥", "⌐ⓝ°ⓒ"]
    
    // Conform to size of smallest element
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(noggles, id: \.self) { noggle in
                        ZStack {
                            Button(noggle) {
                                complexSuccess()
                                copyToClipboard(noggle: noggle)
                            }
                            .buttonStyle(NogglesButton())
                            .padding(.bottom)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .onChange(of: scenePhase) { phase in
                prepareHaptics()
            }
            .background(.nounsYellow)
            .navigationTitle(buttonText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.nounsYellow, for: .navigationBar)
            .preferredColorScheme(.light)
        }
        
    }
    
    // Copy Functionality
    func copyToClipboard(noggle: String) {
        pasteboard.string = noggle
        buttonText = "copied ✓"
        // After 1.5 seconds, change the title back to the original text
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            buttonText = "⌐◨-◨"
        }
    }
    
    // Haptics
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // sculpt the tap and create an event
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 3)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
