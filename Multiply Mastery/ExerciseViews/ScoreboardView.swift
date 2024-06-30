//
//  ScoreboardView.swift
//  Multiply Mastery
//
//  Created by Nazar on 30.06.2024.
//


import SwiftUI

struct ScoreboardView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var questionsDone: Int
    @Binding var selectedTime: Int
    @Binding var elapsedTime: Int
    @Binding var selectedQuestions: Int
    
    var body: some View {
        VStack {
            Text("Scoreboard")
                .font(.system(size: 60))
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Spacer()
            VStack(spacing: 20) {
                HStack {
                    Text("Questions")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(questionsDone)")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color.orange)
                    .padding()
                
                HStack {
                    Text("Time")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(questionsDone != selectedQuestions ? "\(selectedTime) min" : "\((selectedTime * 60) - elapsedTime) sec")")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal, 20)
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Text("Done")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(20)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.orange.edgesIgnoringSafeArea(.all))
    }
}

