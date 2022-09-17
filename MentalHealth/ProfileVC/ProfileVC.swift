//
//  ProfileVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class ProfileVC: DefaultViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "user"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "nameLabel"
        label.textColor = .black
        label.font = UIFont.mainRegular()
        return label
    }()
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "emailLabel"
        label.textColor = .lightGray
        label.font = UIFont.mainRegular(size: 12)
        return label
    }()
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ProfileTableViewCell.self)
        table.rowHeight = 200
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
        table.separatorColor = UIColor.darkGreen
        return table
    }()

    private var items: [String] = ["Some", "Some more", "And more", "And more"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleLabel.text = "Профіль"
        setupView()
    }

    private func setupView() {
        setupHeaderView()
        setupTableView()
    }

    private func setupHeaderView() {
        view.addSubview(imageView, constraints: [
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.widthAnchor.constraint(equalToConstant: 90),
            imageView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])

        view.addSubview(nameLabel, constraints: [
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
        ])

        view.addSubview(emailLabel, constraints: [
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
    }

    private func setupTableView() {
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProfileTableViewCell = tableView.dequeueReusableCell(forItemAt: indexPath)
        let item = items[indexPath.item]
        cell.render(with: item)
        return cell
    }
}
