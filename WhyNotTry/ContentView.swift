//
//  ContentView.swift
//  WhyNotTry
//
//  Created by David Wang on 1/20/25.
//

import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]

    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    
    @State private var selected = "Archery"
    @State private var color = Color.blue
    @State private var id = 1
    
    var body: some View {
        VStack {
            Text("Why not try...")
                .font(.largeTitle.bold())
            
            Spacer()
            
            VStack {
                Circle()
                    .fill(color)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                    )
                Text("\(selected)!")
                    .font(.title.bold())
            }
            .transition(.slide)
            .id(id)
            
            Spacer()
            
            Button("Try again"){
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "Archery"
                    color = colors.randomElement() ?? .blue
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 16))
            .controlSize(.large)
            .tint(color)
            .font(.system(size: 20).bold())
        }
    }
}

#Preview {
    ContentView()
}
