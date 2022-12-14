//
//  BlogTableViewCell.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class BlogTableViewCell: UITableViewCell, ReusableCell {
    typealias Props = Community

    // MARK: - Properties
    private let padding: CGFloat = 16.0

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.mainRegular()
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .lightGray
        label.font = UIFont.mainRegular(size: 12)
        return label
    }()
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.mainLight()
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
    private lazy var peopleStack: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "people-stack")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }

    // MARK: - Set up

    private func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        setupImageView()
        setupTitleLabel()
        setupSubtitleLabel()
        setupButton()
        setupPeopleStack()
    }

    private func setupImageView() {
        contentView.addSubview(image, constraints: [
            image.heightAnchor.constraint(equalToConstant: 90),
            image.widthAnchor.constraint(equalToConstant: 90),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    private func setupTitleLabel() {
        contentView.addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: image.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }

    private func setupSubtitleLabel() {
        contentView.addSubview(subtitleLabel, constraints: [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 24),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    private func setupButton() {
        contentView.addSubview(button, constraints: [
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupPeopleStack() {
        contentView.addSubview(peopleStack, constraints: [
            peopleStack.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            peopleStack.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            peopleStack.heightAnchor.constraint(equalToConstant: 24),
            peopleStack.widthAnchor.constraint(equalToConstant: 84)
        ])
    }

    // MARK: - Public methods

    func render(with props: Props) {
        titleLabel.text = props.title
        subtitleLabel.text = props.description
        image.image = UIImage(named: props.image)
        if props.isParticipant {
            button.setTitle("??????????????????", for: .normal)
            button.backgroundColor = UIColor.clear
            button.setTitleColor(UIColor.darkGreen, for: .normal)
            let image = UIImage(named: "mark")?.withRenderingMode(.alwaysTemplate)
            button.setImage(image, for: .normal)
            button.tintColor = UIColor.darkGreen
        } else {
            button.setTitle("????????????????????", for: .normal)
            button.backgroundColor = UIColor.darkGreen
            button.setTitleColor(.white, for: .normal)
            button.setImage(nil, for: .normal)
        }
    }
}
