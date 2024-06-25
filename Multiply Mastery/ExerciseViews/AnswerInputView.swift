//
//  AnswerInput.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//

import SwiftUI

struct AnswerInputView: View {
    
    @State private var isIncorrect: Bool = true
    
    var body: some View {
        VStack {
            if isIncorrect {
                Text("✖ Try Again")
                    .foregroundColor(.red)
                    .font(.system(size: 30))
            } else {
                Text("✓ Good Job")
                    .foregroundColor(.red)
                    .font(.system(size: 30))
            }
        }
    }
}
