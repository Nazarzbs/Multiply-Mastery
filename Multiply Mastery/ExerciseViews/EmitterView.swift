//
//  EmitterView.swift
//  Multiply Mastery
//
//  Created by Nazar on 28.06.2024.
//
import SwiftUI

struct EmitterView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let emitterLayer = CAEmitterLayer()
        
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitterCells()
        
        emitterLayer.emitterSize = CGSize(width: 500, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: 250, y: -10)
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func createEmitterCells() -> [CAEmitterCell] {
        
        var emitterCells: [CAEmitterCell] = []
        for index in 1...12 {
            
            let cell = CAEmitterCell()
            cell.contents = UIImage(named: getImage(index: index))?.cgImage
            
            cell.color = getColor().cgColor
            cell.birthRate = 4.5
            cell.lifetime = 8
            cell.velocity = 120
            cell.scale = 0.04
            cell.scaleRange = 0.04
            cell.emissionLongitude = .pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            cell.yAcceleration = 40
            emitterCells.append(cell)
        }
        return emitterCells
    }

    func getImage(index: Int) -> String {
        if index < 4 {
            return "Rectangle"
        } else if index > 3 && index <= 6  {
            return "Circle"
        } else if index > 7 && index <= 9 {
            return "Star"
        } else {
            return "Triangle"
        }
    }
    
    func getColor() -> UIColor {
        let colors: [UIColor] = [
            UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), // Bright Red
            UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), // Bright Green
            UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), // Bright Blue
            UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), // Bright Yellow
            UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), // Bright Orange
            UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0), // Bright Magenta
            UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), // Bright Cyan
            UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0), // Bright Pink
            UIColor(red: 0.5, green: 0.0, blue: 1.0, alpha: 1.0), // Bright Purple
            UIColor(red: 0.0, green: 1.0, blue: 0.5, alpha: 1.0)  // Bright Lime Green
        ]
        return colors.randomElement()!
    }
}

