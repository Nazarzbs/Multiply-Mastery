//
//  NumericKeypad.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.


import SwiftUI

struct NumericKeypadView: View {
    
    @Binding var userAnswer: String
    @Binding var isInteractive: Bool 

    let numbers = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["<", "0", "↩︎"]
    ]
    
    var body: some View {
        VStack(spacing: 7) {
            ForEach(numbers, id: \.self) { row in
                HStack(spacing: 7) {
                    ForEach(row, id: \.self) { number in
                        Button(action: {
                            if isInteractive {
                                buttonPressed(number)
                            }
                        }) {
                            Text(number)
                                .font(.system(size: 30))
                                .frame(width: 115, height: 55)
                                .background(Color.orange.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .disabled(!isInteractive)
    }
    
    private func buttonPressed(_ title: String) {
            switch title {
            case "<":
                if !userAnswer.isEmpty {
                    userAnswer.removeLast()
                }
            case "↩︎":
                // Perform any action on return key pressed
                break
            default:
                if userAnswer.count < 3 && userAnswer != "?" {
                    userAnswer.append(title)
                } else if userAnswer.count < 3 && userAnswer == "?"{
                    userAnswer = title
                } else if userAnswer.count > 2 {
                    userAnswer = "?"
                }
            }
        if userAnswer == "" {
            userAnswer = "?"
        }
    }
}

