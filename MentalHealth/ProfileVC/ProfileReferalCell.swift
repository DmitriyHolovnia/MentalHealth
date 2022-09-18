//
//  ProfileReferalCell.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class ProfileReferralCell: UITableViewCell, ReusableCell {
    
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
        label.text = "Запросити побратима \nв додаток"
        label.textColor = .black
        label.font = UIFont.mainRegular()
        label.numberOfLines = 2
        return label
    }()
    private let mainImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "mail")
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
    
    func setupViews() {
        contentView.addSubview(containerView, constraints: [
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 80),
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.addSubview(titleLabel, constraints: [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.addSubview(mainImage, constraints: [
            mainImage.heightAnchor.constraint(equalToConstant: 64),
            mainImage.widthAnchor.constraint(equalToConstant: 94),
            mainImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            mainImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

}
