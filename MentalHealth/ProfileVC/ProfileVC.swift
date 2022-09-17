//
//  ProfileVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class ProfileVC: DefaultViewController {

    private var items: [String] = ["Сповіщення", "Синхронізація з Apple Health", "Змінити пароль", "Технічна підтримка"]
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "user-image"))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Пуля, 32"
        label.textColor = .black
        label.font = UIFont.mainRegular(size: 18)
        return label
    }()
    private lazy var segmentControl: UISegmentedControl = {
        let items = ["Налаштування", "Історія"]
        let sc = UISegmentedControl(items: items)
        sc.addTarget(self, action: #selector(segmentControlDidSelect), for: .valueChanged)
        sc.selectedSegmentIndex = 0
        sc.selectedSegmentTintColor = .lightGreen
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGreen,
                                   NSAttributedString.Key.font: UIFont.mainLight(size: 13)],
                                  for: .selected)
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray,
                                   NSAttributedString.Key.font: UIFont.mainLight(size: 13)],
                                  for: .normal)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ProfileTableViewCell.self)
        table.rowHeight = 200
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        return table
    }()
    private lazy var editButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.4078431373, blue: 0.3960784314, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        titleLabel.text = "Профіль"
        
        view.addSubview(imageView, constraints: [
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.widthAnchor.constraint(equalToConstant: 98),
            imageView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(nameLabel, constraints: [
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])

        view.addSubview(segmentControl, constraints: [
            segmentControl.heightAnchor.constraint(equalToConstant: 48),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            segmentControl.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24)
        ])
        
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        view.addSubview(editButton, constraints: [
            editButton.heightAnchor.constraint(equalToConstant: 36),
            editButton.widthAnchor.constraint(equalToConstant: 36),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            editButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
        
    }
    
    @objc
    func segmentControlDidSelect(_ sender: UISegmentedControl) {
        
    }
}

extension ProfileVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
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
