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
        
        OnBoardinPage(title: "", description: "", image: "Mercury"),
        OnBoardinPage(title: "", description: "", image: "Venus"),
        OnBoardinPage(title: "", description: "", image: "Earth"),
        OnBoardinPage(title: "", description: "", image: "Mars"),
        OnBoardinPage(title: "", description: "", image: "Jupiter"),
        OnBoardinPage(title: "", description: "", image: "Saturn"),
        OnBoardinPage(title: "", description: "", image: "Uranus"),
        OnBoardinPage(title: "", description: "", image: "Neptune"),
        OnBoardinPage(title: "", description: "", image: "Pluto"),
    ]
    
    var body: some View {
        
        ZStack {
            
            if isOnboardingDone{
                
            } else {
                VStack {
                    TabView(selection: $currentPageIndex) {
                        ForEach(0..<pages.count) { index in
                            OnBoardinPageView(page: pages[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    Button(action: {
                        if currentPageIndex < pages.count - 1 {
                            withAnimation {
                                currentPageIndex += 1
                            }
                        } else {
                            withAnimation {
                                isOnboardingDone = true
                            }
                        }
                    }){
                        
                    }
                }
            }
        }
    }
    
    struct OnBoardinPage: Identifiable {
        var id = UUID()
        var title: String
        var description: String
        var image: String
    }
    
    struct OnBoardinPageView: View {
        
        var page: OnBoardinPage
        
        var body: some View {
            
            VStack {
                Text(page.title)
                
                VStack {
                    Image(page.image)
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
