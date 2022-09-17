//
//  BlogVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

struct Community {
    let title: String
    let description: String
    let image: String
    let author: User
    let users: [User]
    let isParticipant: Bool
}

struct Comment {
    let text: String
    let user: User
}

struct User {
    let name: String
    let email: String
    let image: String
}

class BlogVC: UIViewController {
    private let padding: CGFloat = 16.0

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
        title = "Спільноти"
        setupView()
    }

    private func setupView() {
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView, withSafeAreaEdgeInsets: .init(top: 0, left: padding / 2, bottom: 0, right: padding / 2))
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
