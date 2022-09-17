//
//  InstructionView.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class InstructionView: UIView {

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainRegular(size: fontSize)
        label.textColor = .black
        label.text = title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let height: CGFloat
    private let title: String
    private let image: String
    private let fontSize: CGFloat

    init(height: CGFloat = 64, title: String, image: String, fontSize: CGFloat = 14) {
        self.height = height
        self.title = title
        self.image = image
        self.fontSize = fontSize
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        layer.cornerRadius = 12
        backgroundColor = UIColor.reallyLightGray
        heightAnchor.constraint(equalToConstant: height).isActive = true

        addSubview(imageView, constraints: [
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        addSubview(titleLabel, constraints: [
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -10),
        ])
    }
}
