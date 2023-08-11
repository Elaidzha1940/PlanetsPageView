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
        
        OnBoardinPage(title: "Mercury", description: "", image: "Mercury"),
        OnBoardinPage(title: "Mars", description: "", image: "Mars"),
        OnBoardinPage(title: "Earth", description: "", image: "Earth"),
       
    ]
    
    var body: some View {
        
        ZStack {
            Main()
            if isOnboardingDone{
            } else {
                VStack {
                    TabView(selection: $currentPageIndex) {
                        ForEach(0..<pages.count) { index in
                            OnBoardinPageView(page: pages[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    
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
                        Text(currentPageIndex < pages.count - 1 ? "Continue" : "Start")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            .padding()
                    }
                    //.padding()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
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
            
            VStack(alignment: .leading, spacing: 20) {
                Text(page.title)
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                VStack {
                    Image(page.image)
                }
            }
            .padding()
        }
    }
    
    struct Main: View {
        var body: some View {
            Text("Home")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
