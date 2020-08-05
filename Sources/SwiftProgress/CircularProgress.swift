//
//  CircularProgress.swift
//  
//
//  Created by Enes Karaosman on 13.04.2020.
//

import SwiftUI

public struct CircularProgress: Animatable, View {
    
    /// Between 0 - 100
    private var progress: CGFloat
    private let lineWidth: CGFloat
    private var foregroundColor: Color?
    private let backgroundColor: Color
    private var gradient: LinearGradient?
    
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
            return AnyView(
                RingShape(progress: progress, lineWidth: lineWidth)
                    .foregroundColor(self.foregroundColor)
            )
        } else {
            return AnyView(
                self.gradient!.clipShape(RingShape(progress: progress, lineWidth: lineWidth))
            )
        }
    }
    
    public init(progress: CGFloat, lineWidth: CGFloat, foregroundColor: Color, backgroundColor: Color = .clear) {
        self.progress = progress
        self.lineWidth = lineWidth
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    public init(progress: CGFloat, lineWidth: CGFloat, gradient: LinearGradient, backgroundColor: Color = .clear) {
        self.progress = progress
        self.lineWidth = lineWidth
        self.gradient = gradient
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        ZStack {
            RingShape(progress: 100, lineWidth: lineWidth)
                .foregroundColor(backgroundColor)
            
            RingShape(progress: progress, lineWidth: lineWidth)
                .overlay(overlay)
        }
    }
    
}

public struct RingShape: Shape {
    
    /// Between 0 - 100
    public let progress: CGFloat
    public let lineWidth: CGFloat
    
    public func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.midX - lineWidth
        
        var path = Path()
        
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(0),
            endAngle: .degrees(3.6 * Double(progress)),
            clockwise: false
        )
        
        return path.strokedPath(.init(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        
    }
    
}
