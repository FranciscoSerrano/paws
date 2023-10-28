//
//  ContentView.swift
//  paws
//
//  Created by Francisco Serrano on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    @State var isShowingSettings = false
    @State var bgColor: Color = .pink
    
    let offText = "Turning on Paws will pause keyboard inputs if a cat is detected!"
    let onText = "Enjoy uninterrupted keyboard usage!"
    
    var body: some View {
        VStack {
            
            Text(isActive ? onText : offText)
                .multilineTextAlignment(.center)
                .font(.headline)
                .foregroundColor(.primary)
            
            Image(isActive ? "cat2" : "cat3")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            ControlGroup {
                Button {
                    isActive.toggle()
                } label: {
                    Label(isActive ? "Off" : "On", systemImage: isActive ? "keyboard.fill" : "keyboard")
                }
                
                Button {
                    isShowingSettings.toggle()
                } label: {
                    Label("Settings", systemImage: "gear")
                }
                    
                Button {
                    NSApp.terminate(nil)
                } label: {
                    Label("Quit", systemImage: "power")
                }
                .keyboardShortcut("q")
            }
        }
        .padding()
        .frame(width: 200, height: 250)
        .background(bgColor)
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(active: $isShowingSettings, bgColor: $bgColor)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
