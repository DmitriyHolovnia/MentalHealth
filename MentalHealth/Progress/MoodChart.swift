//
//  MoodChart.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import SwiftUI
import Charts

struct MoodChart: View {
    
    let data: [MoodProgress]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.lightGreen)
            
            VStack(spacing: 0) {
                HStack {
                    Text("Mood chart")
                        .font(.mainMedium())

                    Spacer()
                }
                .padding(.leading, 10)
                .padding(.top, 10)
                
                HStack {
                    VStack {
                        Spacer()
                        ForEach(Mood.allCases.reversed()) { mood in
                            Text(mood.title)
                                .font(.system(size: 10))
                            Spacer()
                        }
                    }
                    .padding(.leading, 7)
                    
                    chart
                }
            }
            .padding(5)
        }
    }
    
    var chart: some View {
        Chart(data) {
            LineMark(
                x: .value("Mount", $0.date),
                y: .value("Value", $0.mood.rawValue)
            )
            .foregroundStyle(Color.darkGreen)
            PointMark(
                x: .value("Mount", $0.date),
                y: .value("Value", $0.mood.rawValue)
            )
            .foregroundStyle(Color.darkGreen)
        }
        .chartYAxis(.hidden)
        .chartYAxisLabel("")
    }
}

struct MoodChart_Previews: PreviewProvider {
    static var previews: some View {
        MoodChart(data: [])
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
