//
//  PageView.swift
//  Budget-Voyage
//
//  Created by Asif on 5/16/24.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 20) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .cornerRadius(10)
                .padding()
            
            Text(page.name)
                .font(Font.custom("Hiragino Mincho ProN", size: 24))
                .foregroundColor(.white)
            
            Text(page.description)
                .font(Font.custom("Hiragino Mincho ProN", size: 18))
                .foregroundColor(.white)
                .frame(width: 300)
        }
        .frame(width: 600, height: 600)
    }
}

#Preview {
    PageView(page: Page.samplePage)
}

