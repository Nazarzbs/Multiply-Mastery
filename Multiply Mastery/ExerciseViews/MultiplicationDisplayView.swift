//
//  MultiplicationDisplay.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//

import SwiftUI

struct MultiplicationDisplayView: View {
    
    @State private var showText = false
    
    @Binding var selectedTimesTables: Set<Int>
    @Binding var userAnswer: String
    @Binding var number1: Int
    @Binding var number2: Int
    @Binding var isInteractive: Bool
    @Binding var questionsDone: Int
    @Binding var trigger: Bool
    @Binding var selectedQuestions: Int
    
    var firstNumber: Int {
        guard let randomTable = selectedTimesTables.randomElement() else {
            return 0
        }
        return randomTable
    }
 
    var secondNumber: Int {
        return Int.random(in: 1..<12)
    }

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                if String(number1 * number2) == userAnswer {
                   
                    Text("Correct! ✅")
                        .foregroundColor(.red)
                        .font(.system(size: 70))
                        .onAppear {
                            withAnimation(.spring) {
                                trigger = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.bouncy) {
                                    isInteractive = false
                                    
                                    number1 = firstNumber
                                    number2 = secondNumber
                                    userAnswer = "?"
                                    showText = true
                                    questionsDone += 1
                                   
                                }
                            }
                        }
            
                } else if questionsDone == selectedQuestions {
                    
                    Text("Well Done! 🎉")
                        .foregroundColor(.red)
                        .font(.system(size: 50))
                        .onAppear {
                            withAnimation(.spring) {
                                trigger = true
                            }
                        }
                
                } else {
                    
                    Text("\(number1) × \(number2) = \(userAnswer)")
                        .font(.system(size: 70))
                        .foregroundColor(.red)
                        .bold()
                        .animation(.easeOut(duration: 0.5), value: showText)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .onAppear {
                            withAnimation(.spring) {
                                trigger = false
                                isInteractive = true
                                showText = false
                            }
                            
                        }
                        .onDisappear {
                            withAnimation(.spring) {
                                isInteractive = false
                            }
                        }
                }
            }
        }
        .fixedSize()
    }
}
