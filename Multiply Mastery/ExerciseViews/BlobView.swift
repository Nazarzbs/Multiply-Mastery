//
//  BlobView.swift
//  Multiply Mastery
//
//  Created by Nazar on 24.06.2024.
//

import SwiftUI

struct BlobView: View {
    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom)
        
        VStack {
            Text("100%")
                .font(.custom("Helvetica", fixedSize: 40))
            
            BlobAnimation(width: 220,
                   height: 220,
                   curveHeight: 10,
                   curveLength: 0.5,
                   speed: 0.01,
                   color: gradient
            )
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
        }
    }
}
