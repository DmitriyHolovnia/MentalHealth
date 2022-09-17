//
//  ProfileTableViewCell.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell, ReusableCell {
    typealias Props = String

    private let padding: CGFloat = 16.0

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.mainRegular()
        label.numberOfLines = 1
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

    private func setupView() {
        contentView.backgroundColor = UIColor.lightGreen
        contentView.addSubview(titleLabel, withEdgeInsets: .init(top: 0, left: 16, bottom: 0, right: 0))
    }

    // MARK: - Public methods

    func render(with props: Props) {
        titleLabel.text = props
    }
}
