//
//  LinearProgress.swift
//  
//
//  Created by Enes Karaosman on 13.04.2020.
//

import SwiftUI

public struct LinearProgress: View {
    
    /// Between 0 - 100
    private var progress: CGFloat
    
    private let cornerRadius: CGFloat
    private let backgroundColor: Color
    private var foregroundColor: Color?
    private var gradient: LinearGradient?
    
    private var overlay: AnyView {
        if self.foregroundColor != nil {
            return AnyView( Rectangle().foregroundColor(self.foregroundColor) )
        } else {
            return AnyView( self.gradient! )
        }
    }
    
    public init(progress: CGFloat, foregroundColor: Color, backgroundColor: Color = .clear, cornerRadius: CGFloat = 8) {
        self.progress = progress
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
    
    public init(progress: CGFloat, gradient: LinearGradient, backgroundColor: Color = .clear, cornerRadius: CGFloat = 8) {
        self.progress = progress
        self.backgroundColor = backgroundColor
        self.gradient = gradient
        self.cornerRadius = cornerRadius
    }
    
    private func needsToBeFilledWidth(totalWidth: CGFloat) -> CGFloat {
        return totalWidth * (100 - self.progress) / 100
    }
    
    public var body: some View {
        
        GeometryReader { geometry in
            
            Rectangle().foregroundColor(self.backgroundColor)
                .overlay(
                    self.overlay
                        .offset(x: -self.needsToBeFilledWidth(totalWidth: geometry.size.width))
                )
                .clipShape(Rectangle())
                .cornerRadius(self.cornerRadius)
            
        }
        
    }
    
}
