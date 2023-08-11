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
        
        OnBoardinPage(title: "Mercury", description: "Mercury is the smallest planet in our solar system. It's a little bigger than Earth's Moon.", image: "Mercury"),
        OnBoardinPage(title: "Mars", description: "​Mars is the fourth planet from the Sun – a dusty, cold, desert world with a very thin atmosphere.", image: "Mars"),
        OnBoardinPage(title: "Earth", description: "Earth is the fifth-largest planet in the solar system. Its diameter is about 8,000 miles.", image: "Earth"),
       
    ]
    
    var body: some View {
        
        ZStack {
            ZStack {
                Color.black
                
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
                            Text(currentPageIndex < pages.count - 1 ? "Continue" : "Start")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
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
            
            VStack(alignment: .leading, spacing: 10) {
                Text(page.title)
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                Text(page.description)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(.gray)

                VStack {
                    Image(page.image)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fill)
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
