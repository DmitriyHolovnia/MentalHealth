//
//  ProfileTableViewCell.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell, ReusableCell {
    typealias Props = String

    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.mainRegular()
        label.numberOfLines = 1
        return label
    }()
    private let forwardImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "forward-arrow")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

    private func setupViews() {
        contentView.addSubview(containerView, constraints: [
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 56),
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.addSubview(titleLabel, constraints: [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.addSubview(forwardImage, constraints: [
            forwardImage.heightAnchor.constraint(equalToConstant: 14),
            forwardImage.widthAnchor.constraint(equalToConstant: 8),
            forwardImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -22),
            forwardImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

    // MARK: - Public methods

    func render(with props: Props) {
        titleLabel.text = props
    }
}
