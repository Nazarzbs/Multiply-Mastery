//
//  NumericKeypad.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//

import SwiftUI

struct NumericKeypadView: View {
    
    @Binding var answer: [String] 
    @State var numberOfButtonsPressed = 0
    
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
                            if number == "<" {
                                if numberOfButtonsPressed != 0 {
                                    
                                    answer[numberOfButtonsPressed - 1] = ""
                                    numberOfButtonsPressed -= 1
                                    
                                } else {
                                    numberOfButtonsPressed = 0
                                    
                                }
                            } else if numberOfButtonsPressed >= 3 {
                                numberOfButtonsPressed = 0
                                answer = ["?", " ", " "]
                               
                            } else if numberOfButtonsPressed <= 2 {
                                answer[numberOfButtonsPressed] = number
                                numberOfButtonsPressed += 1
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
    }
}

