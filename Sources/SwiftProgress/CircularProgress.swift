//
//  CircularProgress.swift
//  
//
//  Created by Enes Karaosman on 13.04.2020.
//

import SwiftUI

public struct CircularProgress: View {
    
    /// Between 0 - 100
    private var currentPercentage: CGFloat
    private let lineWidth: CGFloat
    private var foregroundColor: Color?
    private let backgroundColor: Color
    private var gradient: LinearGradient?
    
    private var overlay: AnyView {
        if self.foregroundColor != nil {
            return AnyView(
                RingShape(currentPercentage: currentPercentage, lineWidth: lineWidth)
                    .foregroundColor(self.foregroundColor)
            )
        } else {
            return AnyView(
                self.gradient!.clipShape(RingShape(currentPercentage: currentPercentage, lineWidth: lineWidth))
            )
        }
    }
    
    public init(currentPercentage: CGFloat, lineWidth: CGFloat, foregroundColor: Color, backgroundColor: Color = .clear) {
        self.currentPercentage = currentPercentage
        self.lineWidth = lineWidth
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    public init(currentPercentage: CGFloat, lineWidth: CGFloat, gradient: LinearGradient?, backgroundColor: Color = .clear) {
        self.currentPercentage = currentPercentage
        self.lineWidth = lineWidth
        self.gradient = gradient
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        ZStack {
            RingShape(currentPercentage: 100, lineWidth: lineWidth)
                .foregroundColor(backgroundColor)
            
            RingShape(currentPercentage: currentPercentage, lineWidth: lineWidth)
                .overlay(overlay)
        }
    }
    
}

public struct RingShape: Shape {
    
    /// Between 0 - 100
    public let currentPercentage: CGFloat
    public let lineWidth: CGFloat
    
    public func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.midX - lineWidth
        
        var path = Path()
        
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(0),
            endAngle: .degrees(3.6 * Double(currentPercentage)),
            clockwise: false
        )
        
        return path.strokedPath(.init(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        
    }
    
}
