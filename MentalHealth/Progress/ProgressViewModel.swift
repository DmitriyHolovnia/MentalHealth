//
//  ProgressViewModel.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import Combine

class ProgressViewModel: ObservableObject {
    
    let chartData: [MoodProgress] = [
        MoodProgress(date: "10 Sep", mood: .bad),
        MoodProgress(date: "11 Sep", mood: .sad),
        MoodProgress(date: "12 Sep", mood: .sad),
        MoodProgress(date: "13 Sep", mood: .good),
        MoodProgress(date: "14 Sep", mood: .sad),
        MoodProgress(date: "15 Sep", mood: .good),
        MoodProgress(date: "16 Sep", mood: .happy),
        MoodProgress(date: "17 Sep", mood: .good)
    ]
}
