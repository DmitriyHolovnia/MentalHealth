//
//  SearchView.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class SearchView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "search"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private let textField: UITextField = {
        let textField = UITextField()

        return textField
    }()
}
