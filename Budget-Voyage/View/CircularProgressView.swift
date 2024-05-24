//
//  CircularProgressView.swift
//  Budget-Voyage
//
//  Created by Min Thu Khine on 5/21/24.
//

import SwiftUI

struct CircularProgressView: View {
    @State var progressValue: Float = 0.0
        
    var body: some View {
        VStack {
            CircularProgress(progress: $progressValue)
                .frame(width: 160, height: 160)
                .padding(20.0)
            
            Button("Increment") {
                if progressValue < 1.0 {
                    progressValue += 0.2
                } else {
                    progressValue = 0.0
                }
            }
        }
    }
}


struct CircularProgress: View {
    
    @Binding var progress: Float
    var color: Color = .green
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundStyle(.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundStyle(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 0.5))
        }
    }
}

#Preview {
    CircularProgressView()
}
