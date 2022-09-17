//
//  BlogCollectionViewCell.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class BlogCollectionViewCell: UICollectionViewCell, ReusableCell {
    typealias Props = Community

    // MARK: - Properties
    private let padding: CGFloat = 16.0

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    private let subtitleLabel = UILabel()
    private let authorImage = UIImageView()

    // MARK: - Life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set up

    private func setup() {
        contentView.layer.cornerRadius = padding
        contentView.clipsToBounds = true
        setupTitleLabel()
        setupImageView()
        setupSubtitleLabel()
    }

    private func setupTitleLabel() {
        contentView.addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }

    private func setupImageView() {
        contentView.addSubview(authorImage, constraints: [
            authorImage.heightAnchor.constraint(equalToConstant: padding * 1.5),
            authorImage.widthAnchor.constraint(equalToConstant: padding * 1.5),
            authorImage.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }

    private func setupSubtitleLabel() {
        contentView.addSubview(subtitleLabel, constraints: [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    // MARK: - Public methods

    func render(with props: Props) {
        titleLabel.text = props.title
        subtitleLabel.text = props.description
        authorImage.image = UIImage(named: props.image)
    }
}
