//
//  SettingsView.swift
//  paws
//
//  Created by Francisco Serrano on 3/11/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var active: Bool
    @Binding var bgColor : Color
    @State var sensitivity = 3.0
    let colors: [Color] = [.mint, .pink, .red, .purple, .orange, .gray]
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.headline)
                .padding(.bottom)
            
            Text("Sensitivity: \(sensitivity.formatted(.number))")
            Slider(value: $sensitivity, in: 1...5, step: 1)
            
            Text("Background Color")
            HStack {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .foregroundColor(color)
                        .shadow(radius: 2)
                        .onTapGesture {
                            bgColor = color
                        }
                }
            }

            Spacer()

            HStack {
                
                Button {
                    active.toggle()
                } label: {
                    Label("Back", systemImage: "chevron.left")
                }
                .blendMode(.sourceAtop)
                
                Spacer()
            }
        }
        .padding()
        .frame(width: 200, height: 250)
        .background(bgColor)

    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(active: $active, bgColor: $bgColor)
//    }
//}
