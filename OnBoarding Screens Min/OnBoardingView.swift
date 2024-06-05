
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
                                PageView(page: page)
                                    .padding(.horizontal)
                                    .foregroundColor(.white)
                                    .font(Font.custom("Hiragino Mincho ProN", size: 18))
                                
                                
                                if page == pages.last {
                                    Button("Let's Get Started", action: {
                                        isCreateTripViewActive = true
                                        isOnboarding = false
                                    })
                                    .font(Font.custom("Hiragino Mincho ProN", size: 15))
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color(hex: "BDC487"))
                                    .fullScreenCover(isPresented: $isCreateTripViewActive, content: {
                                        CreateTripView()
                                    })
                                }
                            }
                            .tag(page.tag)
                        }
                    }
                    .animation(.easeInOut, value: pageIndex)
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                }
                .onAppear{
                    dotAppearance.currentPageIndicatorTintColor = .black
                    dotAppearance.pageIndicatorTintColor = .gray
                }
                .padding()
                .background(Color(hex: "#0B5351").edgesIgnoringSafeArea(.all))
                .navigationTitle("")
            }
        } else {
            SplashScreenView()
            Image("BackImg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
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



//.background(Color(hex: "#0B5351").edgesIgnoringSafeArea(.all))
