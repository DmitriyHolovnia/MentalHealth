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
        case .bad: return "âšī¸"
        case .sad: return "đ"
        case .neutral: return "đ"
        case .good: return "đ"
        case .happy: return "đ"
        }
    }
    
    var id: Int { self.rawValue }

}
