//
//  MoodProgress.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import Foundation

struct MoodProgress: Identifiable {
    var id = UUID()
    let date: String
    let mood: Mood
}
