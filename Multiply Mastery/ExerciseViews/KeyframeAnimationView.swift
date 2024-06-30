//
//  KeyframeAnimationView.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//https://gist.github.com/davidsteppenbeck/20d16160b6b037b193a308349ff36a18

import SwiftUI

struct KeyframeValues {
    var scale: CGFloat = 1.0
    var horizontalStretch: CGFloat = 1.0
    var verticalStretch: CGFloat = 1.0
    var translation: CGFloat = 0.0
    var rotation: Angle = .zero
}

struct KeyFrameAnimationView: View {
    @Binding var number1: Int
    @Binding var trigger: Bool
    
    var body: some View {
        Image("Asset \(number1)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 260, height: 260)
            .shadow(color: .gray, radius: 2, x: 3, y: 3)
            .if(trigger) { image in
                image.keyframeAnimator(initialValue: KeyframeValues()) { content, value in
                    content
                        .scaleEffect(value.scale)
                        .scaleEffect(x: value.horizontalStretch, y: value.verticalStretch)
                        .offset(y: value.translation)
                        .rotationEffect(value.rotation)
                } keyframes: { value in
                    KeyframeTrack(\.scale) {
                        LinearKeyframe(1.0, duration: 0.5)
                        SpringKeyframe(1.2, duration: 0.7)
                        SpringKeyframe(1.0, spring: .bouncy)
                    }
                    
                    KeyframeTrack(\.translation) {
                        LinearKeyframe(0.0, duration: 0.4)
                        SpringKeyframe(15.0, duration: 0.1, spring: .bouncy)
                        SpringKeyframe(-50.0, duration: 0.7, spring: .bouncy)
                        SpringKeyframe(15.0, duration: 0.05, spring: .bouncy)
                        SpringKeyframe(0.0, spring: .bouncy)
                    }
                    
                    KeyframeTrack(\.horizontalStretch) {
                        CubicKeyframe(1.0, duration: 0.4)
                        CubicKeyframe(1.6, duration: 0.1)
                        CubicKeyframe(0.8, duration: 0.05)
                        CubicKeyframe(0.95, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.7)
                        CubicKeyframe(1.05, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.2)
                    }
                    
                    KeyframeTrack(\.verticalStretch) {
                        CubicKeyframe(1.0, duration: 0.4)
                        CubicKeyframe(0.8, duration: 0.1)
                        CubicKeyframe(1.1, duration: 0.05)
                        CubicKeyframe(1.05, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.7)
                        CubicKeyframe(0.9, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.2)
                    }
                    
                    KeyframeTrack(\.rotation) {
                        LinearKeyframe(Angle.zero, duration: 0.8)
                        SpringKeyframe(Angle(degrees: 50), duration: 0.08)
                        SpringKeyframe(Angle(degrees: -50), duration: 0.08)
                        SpringKeyframe(Angle.zero, duration: 0.5, spring: .bouncy)
                    }
                }
            }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
