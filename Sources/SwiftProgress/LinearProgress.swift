//
//  LinearProgress.swift
//  
//
//  Created by Enes Karaosman on 13.04.2020.
//

import SwiftUI

public struct LinearProgress: Animatable, View {
    
    public enum FillAxis {
        case horizontal
        case vertical
    }
    
    /// Between 0 - 100
    private var progress: CGFloat
    
    private let cornerRadius: CGFloat
    private let backgroundColor: Color
    private var foregroundColor: Color?
    private var gradient: LinearGradient?
    private let fillAxis: FillAxis
    
    public var animatableData: Double {
        get {
            return Double(progress)
        }
        set {
            progress = CGFloat(newValue)
        }
    }
    
    private var overlay: AnyView {
        if self.foregroundColor != nil {
            return AnyView( Rectangle().foregroundColor(self.foregroundColor) )
        } else {
            return AnyView( self.gradient! )
        }
    }
    
    public init(progress: CGFloat, foregroundColor: Color, backgroundColor: Color = .clear, cornerRadius: CGFloat = 8, fillAxis: FillAxis = .horizontal) {
        self.progress = progress
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.fillAxis = fillAxis
    }
    
    public init(progress: CGFloat, gradient: LinearGradient, backgroundColor: Color = .clear, cornerRadius: CGFloat = 8, fillAxis: FillAxis = .horizontal) {
        self.progress = progress
        self.backgroundColor = backgroundColor
        self.gradient = gradient
        self.cornerRadius = cornerRadius
        self.fillAxis = fillAxis
    }
    
    private func needsToBeFilledArea(totalArea: CGFloat) -> CGFloat {
        return totalArea * (100 - self.progress) / 100
    }
    
    private func calculateOffset(totalArea: CGSize) -> CGSize {
        if self.fillAxis == .horizontal {
            return CGSize(
                width: -self.needsToBeFilledArea(totalArea: totalArea.width),
                height: 0
            )
        }
        return CGSize(
            width: 0,
            height: self.needsToBeFilledArea(totalArea: totalArea.height)
        )
    }
    
    public var body: some View {
        
        GeometryReader { geometry in
            
            Rectangle().foregroundColor(self.backgroundColor)
                .overlay(
                    self.overlay
                        .offset(self.calculateOffset(totalArea: geometry.size))
                )
                .clipShape(Rectangle())
                .cornerRadius(self.cornerRadius)
            
        }
        
    }
    
}
