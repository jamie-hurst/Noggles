//
//  ContentView.swift
//  Noggles
//
//  Created by Jameson Hurst on 11/20/22.
//

import SwiftUI


struct ContentView: View {
    @State private var buttonText = "⌐◨-◨"
    
    private let pasteboard = UIPasteboard.general
    private let noggles = ["⌐◨-◨", "◧-◧¬", "⌐◧-◧", "⌐⁞⁚⁞-⁞⁚⁞", "⌐◫-◫", "⌐◪-◪", "⌐◮-◮", "⌐♥-♥", "⌐🄶-🄼", "⌐ⓝ°ⓒ"]
    
    // Conform to size of smallest element
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(noggles, id: \.self) { noggle in
                        ZStack {
                            Button {
                                copyToClipboard(noggle: noggle)
                            } label: {
                                
                                ZStack {
                                    Rectangle()
                                        .nogglesIconStyle()
                                    
                                    Text("\(noggle)")
                                        .foregroundColor(.nounsRed)
                                        .font(.title)
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                }
            }
            .navigationTitle(buttonText)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    
    func copyToClipboard(noggle: String) {
        pasteboard.string = noggle
        
        buttonText = "copied ✓"
        
        // After 1.5 seconds, change the title back to the original text
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            buttonText = "⌐◨-◨"
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
