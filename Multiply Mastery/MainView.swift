//
//  MainView.swift
//  Multiply Mastery
//
//  Created by Nazar on 22.06.2024.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTimesTables: Set<Int> = []
    @State private var selectedQuestions = 5
    @State private var selectedTimer = 1
    @State private var timesTablesAnimals = Array(1...19).shuffled()

    let timesTables = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    
    let questionsOptions = [5, 10, 20, 50, 100]
    let timerOptions = [1, 3, 5, 10, 15]

    var body: some View {
        NavigationView {
            VStack() {
                Text("Select Times Tables")
                    .multilineTextAlignment(.leading)
                    .font(.title)
                    .bold()
                
                withAnimation(.spring(duration: 1, bounce: 0.6)) {
                    VStack {
                        HStack {
                            ForEach(timesTables, id: \.self) { image in
                                if image % 2 != 0 {
                                    if selectedTimesTables.contains(image) {
                                        
                                        Image("Asset \((timesTablesAnimals)[image])")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 40)
                                    } else {
                                        Text("\(image)")
                                            .frame(width: 50, height: 40)
                                        
                                            .background(Color.gray.opacity(0.3))
                                            .cornerRadius(8)
                                            .mask {
                                                Image("Asset \((timesTablesAnimals)[image])")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 40)
                                            }
                                    }
                                }
                            }
                        }
                        HStack {
                            
                            ForEach(timesTables, id: \.self) { image in
                                if image % 2 == 0 {
                                    if selectedTimesTables.contains(image) {
                                        
                                        Image("Asset \((timesTablesAnimals)[image])")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 40)
                                        
                                    } else {
                                        Text("\(image)")
                                            .frame(width: 50, height: 40)
                                        
                                            .background(Color.gray.opacity(0.3))
                                            .cornerRadius(8)
                                            .mask {
                                                Image("Asset \((timesTablesAnimals)[image])")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 40)
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
                
                GeometryReader {
                    let size = $0.size
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(timesTables, id: \.self) { table in
                                
                                Button(action: {
                                    withAnimation(.spring(duration: 1, bounce: 0.6)) {
                                        if selectedTimesTables.contains(table) {
                                            selectedTimesTables.remove(table)
                                        } else {
                                            selectedTimesTables.insert(table)
                                        }
                                    }
                                }) {
                                    
                                    ZStack {
                                        Color.orange.opacity(1)
                                            .clipShape(.rect(cornerRadius: 20))
                                        
                                        VStack {
                                            Spacer()
                                            Image("\(table)")
                                            if selectedTimesTables.contains(table) {
                                                
                                                Image("Asset \((timesTablesAnimals)[table])")
                                                    .resizable()
                                                    .scaledToFit()
                                                
                                            } else {
                                                Color.gray.opacity(0.6).mask {
                                                    Image("Asset \((timesTablesAnimals)[table])")
                                                        .resizable()
                                                        .scaledToFit()
                                                }
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 65)
                                    .frame(width: size.width, height: 320)
                                    
                                    .visualEffect { content, geometryProxy in
                                        content
                                            .rotationEffect(rotation(geometryProxy, rotation: 5))
                                            .scaleEffect(scale(geometryProxy, scaled: 0.2), anchor: .trailing)
                                            .offset(x: minX(geometryProxy))
                                            .offset(x: excessMinX(geometryProxy, offset: 10))
                                    }
                                }
                                .zIndex(zIndex(table))
                            }
                        }
                        .frame(height: 340)
                    }
                    .scrollTargetBehavior(.paging)
                    .scrollIndicators(.hidden)
                }
                
                Text("Questions to answer")
                    .font(.custom("Helvetica", fixedSize: 22))
                    .bold()
                
                HStack {
                    ForEach(questionsOptions, id: \.self) { question in
                        Button(action: {
                            selectedQuestions = question
                        }) {
                            Text("\(question)")
                                .frame(width: 30, height: 20)
                                .padding()
                                .background(selectedQuestions == question ? Color.orange : Color.gray.opacity(0.3))
                                .cornerRadius(8)
                            
                        }
                    }
                }
                
                Text("Timer")
                    .font(.custom("Helvetica", fixedSize: 22))
                    .bold()
                
                HStack {
                    ForEach(timerOptions, id: \.self) { time in
                        Button(action: {
                            selectedTimer = time
                        }) {
                            Text("\(time)")
                                .frame(width: 30, height: 20)
                                .padding()
                                .background(selectedTimer == time ? Color.orange : Color.gray.opacity(0.3))
                                .cornerRadius(8)
                        }
                    }
                }
                
                NavigationLink(destination: ExerciseView(selectedTimesTables: $selectedTimesTables, selectedQuestions: $selectedQuestions, selectedTime: $selectedTimer)) {
                    Text("Start")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding()
            }
        }
    }
    
    nonisolated func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }
    
    nonisolated func zIndex(_ item: Int) -> CGFloat {
        
        return CGFloat(12) - CGFloat(item)
    }
    
    nonisolated func progress(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat {
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let wight = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let progress = (maxX / wight) - 1.0
        let cappedProgress = min(progress, limit)
       
        return cappedProgress
    }
    
    nonisolated func scale(_ proxy: GeometryProxy, scaled: CGFloat = 0.1) -> CGFloat {
        let progress = progress(proxy, limit: 2)
        return 1 - (progress * scaled)
    }
    
    nonisolated func excessMinX(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
        let progress = progress(proxy)
        return progress * offset
    }
    
    nonisolated func rotation(_ proxy: GeometryProxy, rotation: CGFloat = 5) -> Angle {
        let progress = progress(proxy)
        return .init(degrees: progress * rotation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
