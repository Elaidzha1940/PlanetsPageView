//  /*
//
//  Project: Planets
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.08.2023
//
//  /*

import SwiftUI

struct ContentView: View {
    
    @State private var isOnboardingDone = false
    @State private var currentPageIndex = 0
    
    let pages = [
    
        OnBoardingage(title: "", description: "", image: "Mercury"),
        OnBoardingage(title: "", description: "", image: "Venus"),
        OnBoardingage(title: "", description: "", image: "Earth"),
        OnBoardingage(title: "", description: "", image: "Mars"),
        OnBoardingage(title: "", description: "", image: "Jupiter"),
        OnBoardingage(title: "", description: "", image: "Saturn"),
        OnBoardingage(title: "", description: "", image: "Uranus"),
        OnBoardingage(title: "", description: "", image: "Neptune"),
        OnBoardingage(title: "", description: "", image: "Pluto"),
    ]
    
    var body: some View {
        
        VStack {
            
        }
    }
    
    struct OnBoardingage: Identifiable {
        var id = UUID()
        var title: String
        var description: String
        var image: String
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
