//
//  MultiplicationDisplay.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//

import SwiftUI

struct MultiplicationDisplayView: View {
    @Binding var userAnswer: [String]
    @Binding var selectedTables: Set<Int>
    
//        var firstNumber: Int {
//            guard let randomTable = selectedTables.randomElement() else {
//                return 0
//            }
//            return randomTable
//        }
//    
//        var secondNumber: Int {
//            return Int.random(in: 1..<12)
//        }
   
    var concatenatedString: String {
        userAnswer.joined()
        }
  
    var body: some View {
        VStack(spacing: 16) {
            
            Text("\(0) x \(0) = \(concatenatedString)")
                .font(.system(size: 70))
                .foregroundColor(.red)
                .bold()
            
            Divider()
                .frame(height: 2)
                .background(Color.red)
        }
    }
}
