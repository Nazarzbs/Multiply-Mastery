//
//  ExerciseView.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTimesTables: Set<Int>
    @Binding var selectedQuestions: Int
    @Binding var selectedTimer: Int
    
    @State var answer: [String] = ["?", " ", " "]
   
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                
                BlobView()
                
                MultiplicationDisplayView(userAnswer: $answer, selectedTables: $selectedTimesTables)
                
                AnswerInputView()
                
                NumericKeypadView(answer: $answer)
                   
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        //action
                    } label: {
                        Text("Stop")
                            .foregroundColor(.red)
                            .font(.custom("Helvetica", fixedSize: 30))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                  
                        Text("17/100")
                            .foregroundColor(.red)
                            .font(.custom("Helvetica", fixedSize: 30))
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTimesTables: .constant([1, 2]), selectedQuestions: .constant(50), selectedTimer: .constant(20))
    }
}
