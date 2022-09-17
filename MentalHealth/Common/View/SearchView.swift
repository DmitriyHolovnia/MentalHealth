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
    private lazy var textField: UITextField = {
        let textField = UITextField()

        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font : UIFont.mainLight()
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:attributes)
        return textField
    }()

    private let placeholder: String

    init(placeholder: String = "") {
        self.placeholder = placeholder
        super.init(frame: .zero)
        setupView()
    }

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }

    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        layer.borderWidth = 1.0

        setupImageView()
        setupTextField()
    }

    private func setupImageView() {
        addSubview(imageView, constraints: [
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func setupTextField() {
        addSubview(textField, constraints: [
            textField.heightAnchor.constraint(equalToConstant: 30),
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
