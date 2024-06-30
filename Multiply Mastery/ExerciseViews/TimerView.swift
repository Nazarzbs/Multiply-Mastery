//
//  TimerView.swift
//  Multiply Mastery
//
//  Created by Nazar on 28.06.2024.
//

import SwiftUI
import Combine

struct TimerView: View {
    
    @State private var timer: Timer?
    @State private var showScore: Bool = false
    
    @Binding var elapsedTime: Int 
    @Binding var selectedTime: Int
    @Binding var questionsDone: Int
    @Binding var selectedQuestions: Int
    @Binding var stopTimer: Bool
    @Binding var trigger: Bool
    
    private let width: Double = 180
    
    var body: some View {
        
        VStack {
            Text(timeString(from: elapsedTime))
                .onAppear {
                    startTimer()
                    elapsedTime = selectedTime * 60
                }
                .font(.system(size: 50, weight: .medium, design: .rounded))
                .padding()
                .frame(width: width, height: 50)
                .background(.thinMaterial)
                .cornerRadius(20)
                .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 4)
                    )
        }
        .padding()
        .sheet(isPresented: $showScore) {
            ScoreboardView(questionsDone: $questionsDone, selectedTime: $selectedTime, elapsedTime: $elapsedTime, selectedQuestions: $selectedQuestions)
        }
    }
    
    private func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
          
                if elapsedTime > 0 {
                    elapsedTime -= 1
                    
                    print(elapsedTime)
                } else {
                  
                    withAnimation(.spring) {
                        trigger = true
                        
                    }
                    invalidateTimer()
                    showScore = true
                }
                
                if questionsDone == selectedQuestions {
                    invalidateTimer()
                    
                    showScore = true
                } else if stopTimer == true {
                    invalidateTimer()
                }
            }
        }
    
    func invalidateTimer() {
           timer?.invalidate()
           timer = nil
       }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
