//
//  PlaceHolderModifier.swift
//  Budget-Voyage
//
//  Created by Min Thu Khine on 6/4/24.
//

import SwiftUI

struct PlaceholderModifier: ViewModifier {
    var showPlaceholder: Bool
    var placeholder: String
    var placeholderColor: Color

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceholder {
                Text(placeholder)
                    .foregroundColor(placeholderColor)
                    .padding(.leading, 4)
            }
            content
                .foregroundColor(.white)
                .padding(4)
        }
    }
}

extension View {
    func placeholder(when showPlaceholder: Bool, placeholder: String, placeholderColor: Color = .gray) -> some View {
        self.modifier(PlaceholderModifier(showPlaceholder: showPlaceholder, placeholder: placeholder, placeholderColor: placeholderColor))
    }
}
