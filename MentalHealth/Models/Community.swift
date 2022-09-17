//
//  Community.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import Foundation

struct Community {
    let title: String
    let description: String
    let image: String
    let author: User
    let users: [User]
    let isParticipant: Bool
}
