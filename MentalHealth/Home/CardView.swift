//
//  CardView.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class CardView: UIView {
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainRegular(size: fontSize)
        label.textColor = .black
        label.text = title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainRegular(size: 14)
        label.textColor = UIColor.lightGray
        label.text = subtitle
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var timeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "clock"))
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainRegular(size: 14)
        label.textColor = UIColor.lightGray
        label.text = "7 хв"
        label.isHidden = true
        return label
    }()
    private let height: CGFloat
    private let title: String
    private let subtitle: String
    private let image: String
    private let showTime: Bool
    private let fontSize: CGFloat

    init(height: CGFloat, title: String, subtitle: String, image: String, showTime: Bool = false, fontSize: CGFloat = 18) {
        self.height = height
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.showTime = showTime
        self.fontSize = fontSize
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        layer.cornerRadius = 12
        backgroundColor = .white
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        heightAnchor.constraint(equalToConstant: height).isActive = true

        addSubview(imageView, constraints: [
            imageView.heightAnchor.constraint(equalToConstant: height - 48),
            imageView.widthAnchor.constraint(equalToConstant: height - 48),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
        ])

        addSubview(subtitleLabel, constraints: [
            subtitleLabel.topAnchor.constraint(equalTo: centerYAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -10),
            subtitleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])

        if showTime {
            subtitleLabel.isHidden = true
            timeImageView.isHidden = false
            timeLabel.isHidden = false

            addSubview(timeImageView, constraints: [
                timeImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                timeImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
                timeImageView.heightAnchor.constraint(equalToConstant: 16),
                timeImageView.widthAnchor.constraint(equalToConstant: 16),
            ])

            addSubview(timeLabel, constraints: [
                timeLabel.leadingAnchor.constraint(equalTo: timeImageView.trailingAnchor, constant: 8),
                timeLabel.centerYAnchor.constraint(equalTo: timeImageView.centerYAnchor)
            ])
        }
    }
}
