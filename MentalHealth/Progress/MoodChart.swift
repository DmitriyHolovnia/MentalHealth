//
//  MoodChart.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import SwiftUI
import Charts

struct MoodChart: View {
    
    let data: [MoodProgress] = [
        MoodProgress(date: "jan/22", mood: .bad),
        MoodProgress(date: "feb/22", mood: .sad),
        MoodProgress(date: "mar/22", mood: .bad),
        MoodProgress(date: "apr/22", mood: .good),
        MoodProgress(date: "may/22", mood: .bad),
        MoodProgress(date: "jun/22", mood: .good),
        MoodProgress(date: "jul/22", mood: .happy)
    ]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.yellow)
            
            VStack {
                HStack {
                    Text("Mood chart")
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    
                    Spacer()
                }
                
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
        }
    }
    
    var chart: some View {
        Chart(data) {
            LineMark(
                x: .value("Mount", $0.date),
                y: .value("Value", $0.mood.rawValue)
            )
            PointMark(
                x: .value("Mount", $0.date),
                y: .value("Value", $0.mood.rawValue)
            )
        }
    }
}

struct MoodChart_Previews: PreviewProvider {
    static var previews: some View {
        MoodChart()
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
