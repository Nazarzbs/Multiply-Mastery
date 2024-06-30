//
//  ExerciseView.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedTimesTables: Set<Int>
    @Binding var selectedQuestions: Int
    @Binding var selectedTime: Int
    
    @State private var userAnswer: String = "?"
    @State private var number1: Int = 1
    @State private var number2: Int = 1
    @State private var isCorrect: Bool = false
    @State private var isInteractive: Bool = true
    @State private var questionsDone: Int = 0
    @State private var trigger: Bool = false
    @State private var stopTimer: Bool = false

    var firstNumber: Int {
        guard let randomTable = selectedTimesTables.randomElement() else {
            return 1
        }
        return randomTable
    }
 
    var secondNumber: Int {
        return Int.random(in: 1..<12)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
        
                    VStack(spacing: 5) {
                        TimerView(selectedTime: $selectedTime, questionsDone: $questionsDone, selectedQuestions: $selectedQuestions, stopTimer: $stopTimer)
                            .padding(.top, -80)
                        
                        KeyFrameAnimationView(number1: $number1, trigger: $trigger)
                        
                        MultiplicationDisplayView(selectedTimesTables: $selectedTimesTables, userAnswer: $userAnswer, number1: $number1, number2: $number2, isInteractive: $isInteractive, questionsDone: $questionsDone, trigger: $trigger, selectedQuestions: $selectedQuestions)
                        
                        NumericKeypadView(userAnswer: $userAnswer, isInteractive: $isInteractive)
                            .padding()
                        
                    }
                    
                    .onAppear {
                        
                        number1 = firstNumber
                        number2 = secondNumber
                    }
                
                    EmitterView()
                        .scaleEffect(trigger ? 1 : 0, anchor: .top)
                        .opacity(trigger  ? 1 : 0)
                        .offset(y: trigger ? 0 : 450)
                        .ignoresSafeArea()
                
            }
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        stopTimer = true
                        dismiss()
                        
                    } label: {
                        
                        Text("Stop")
                            .foregroundColor(.red)
                            .font(.custom("Helvetica", fixedSize: 30))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Text("\(questionsDone)" + "/" + "\(selectedQuestions)")
                        .foregroundColor(.red)
                        .font(.custom("Helvetica", fixedSize: 30))
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTimesTables: .constant([1, 2]), selectedQuestions: .constant(3), selectedTime: .constant(1))
    }
}
