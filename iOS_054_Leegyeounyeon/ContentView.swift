//
//  ContentView.swift
//  iOS_054_Leegyeounyeon
//
//  Created by yeon on 2023/07/29.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    @State private var tapCount: Int = 0
    @State private var timeRecords: [String] = [] // 시간 기록을 저장하는 배열
    
    var body: some View {
        TabView(selection: $selection) {
            VStack {
                Text("\(tapCount)")
                    .font(.largeTitle)
                HStack {
                    Button (action: {
                        recordTime()
                    }) {
                        Image(systemName: "square.and.arrow.down.fill")
                        Text("카운트 기록")
                    }
                    .padding()
                    
                    Button (action: {
                        resetRecord()
                    }) {
                        Text("카운트 재설정")
                    }
                }
                ////kokok
            }
            .tabItem {
                Image(systemName: "timer")
                Text("Tab Counter")
            }
            .onTapGesture {
                tapCount += 1
            }
            .tag(1)
            Text("Two")
            List(timeRecords, id: \.self) {
                record in Text(record)
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                Text("Time Record")
            }
            .tag(2)
            Text("만든사람")
                .tabItem {
                    Image(systemName: "person.crop.circle.fill.badge.questionmark")
                    Text("Screen Three")
                }
                .tag(3)
        }
    }
    private func recordTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentTime = formatter.string(from: Date())
        timeRecords.append(currentTime + " 👆tapCount : \(tapCount)")
    }
    private func resetRecord() {
        tapCount = 0
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

