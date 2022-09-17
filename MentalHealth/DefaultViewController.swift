//
//  DefaultViewController.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class DefaultViewController: UIViewController {
    
    private(set) lazy var headerView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private(set) lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.mainRegular(size: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var backgroundView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "header")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTapGesture()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.41),
            
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70),
            
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
