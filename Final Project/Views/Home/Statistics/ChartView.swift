//
//  ChartView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/20/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    let data = [ChartData(day: 1, wordCount: 10),
                ChartData(day: 2, wordCount: 14),
                ChartData(day: 3, wordCount: 22),
                ChartData(day: 4, wordCount: 36),]
    
    var maxChartData: ChartData? {
        data.max { $0.wordCount < $1.wordCount }
    }
    
    var body: some View {
        
        VStack {
            Chart {
                ForEach(data) { dataPoint in
                    LineMark(x: .value("Day", dataPoint.day),
                            y: .value("Word Count", dataPoint.wordCount))
                    .opacity(maxChartData == dataPoint ? 1 : 0.5)
                    .foregroundStyle(Color.orangeA)
                }
            }
            .chartXScale(domain: 1...4)
            .aspectRatio(1, contentMode: .fit)
        .padding()
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
