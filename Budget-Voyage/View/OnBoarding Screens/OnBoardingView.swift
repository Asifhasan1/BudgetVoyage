//
//  ContentView.swift
//  Budget-Voyage
//
//  Created by Asif on 5/16/24.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    @State private var pageIndex = 0
    @State private var isCreateTripViewActive = false
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
        if isOnboarding ?? true {
            NavigationStack {
                VStack {
                    TabView(selection: $pageIndex) {
                        ForEach(pages) { page in
                            VStack {
                                Spacer()
                                PageView(page: page)
                                    .padding(.horizontal)
                                Spacer()
                                if page == pages.last {
                                    Button("Let's Get Started", action: {
                                        isCreateTripViewActive = true
                                        isOnboarding = false
                                    })
                                    .buttonStyle(.bordered)
                                    .fullScreenCover(isPresented: $isCreateTripViewActive, content: {
                                        CreateTripView()
                                    })
                                } else {
                                    Spacer()
                                    Button("Next", action: incrementPage)
                                }
                            }
                            .tag(page.tag)
                        }
                    }
                    .animation(.easeInOut, value: pageIndex)
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    Spacer(minLength: 20)
                }
                .onAppear{
                    dotAppearance.currentPageIndicatorTintColor = .black
                    dotAppearance.pageIndicatorTintColor = .gray
                }
                .padding()
                .navigationTitle("")
            }
        } else {
            MainView()
        }
        
    }
    
    func incrementPage() {
        pageIndex += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}


