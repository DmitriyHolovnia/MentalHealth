//
//  BlogVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class BlogVC: DefaultViewController {
    private let padding: CGFloat = 0.0

    private let seachView = SearchView(placeholder: "Шукати можливості")

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(BlogTableViewCell.self)
        table.rowHeight = 200
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        return table
    }()

    private lazy var myItems: [Community] = [
        .init(
            title: "Рибацький клуб",
            description: "Київ, Україна",
            image: "fishing",
            author: .init(name: "Some name 0", email: "email0@gmail.com", image: "user"),
            users: [],
            isParticipant: true
        )
    ]

    private lazy var allItems: [Community] = [
        .init(
            title: "Рибацький клуб",
            description: "Київ, Україна",
            image: "fishing",
            author: .init(name: "Some name 1", email: "email1@gmail.com", image: "user"),
            users: [],
            isParticipant: false
        ),
        .init(
            title: "Похід в гори",
            description: "Київ, Україна",
            image: "mountains",
            author: .init(name: "Some name 2", email: "email2@gmail.com", image: "user"),
            users: [],
            isParticipant: false
        ),
        .init(
            title: "Реабілітація",
            description: "Київ, Україна",
            image: "rehabilitation",
            author: .init(name: "Some name 2", email: "email3@gmail.com", image: "user"),
            users: [],
            isParticipant: false
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    private func setup() {
        editButton.isHidden = false
        editButton.setImage(UIImage(named: "plus"), for: .normal)
        title = "Спільноти"
        titleLabel.text = title
        setupView()
    }

    private func setupView() {
        setupSearchView()
        setupTableView()
    }

    private func setupSearchView() {
        view.addSubview(seachView, constraints: [
            seachView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            seachView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            seachView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            seachView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func setupTableView() {
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: seachView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension BlogVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.red
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.mainRegular(size: 16)
        header.textLabel?.text = section == 0 ? "Мої спільноти" : "Всі спільноти"
    }
}

extension BlogVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Мої спільноти" : "Всі спільноти"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? myItems.count : allItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let items = section == 0 ? myItems : allItems
        let cell: BlogTableViewCell = tableView.dequeueReusableCell(forItemAt: indexPath)
        let item = items[indexPath.item]
        cell.render(with: item)
        return cell
    }
}
