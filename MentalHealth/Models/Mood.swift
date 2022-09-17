//
//  Mood.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import Foundation

enum Mood: Int, CaseIterable, Identifiable {
    case bad, sad, neutral, good, happy
    
    var title: String {
        switch self {
        case .bad: return "☹️"
        case .sad: return "🙁"
        case .neutral: return "😐"
        case .good: return "🙂"
        case .happy: return "😁"
        }
    }
    
    var id: Int { self.rawValue }

}
