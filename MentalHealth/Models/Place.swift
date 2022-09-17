//
//  Place.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

struct Place {
    let imageName: String
    let title: String
    let subtitle: String
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
}
