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
    private(set) lazy var backgroundView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "header")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private(set) lazy var backArrow: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "back-arrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private(set) lazy var editButton: UIButton = {
       let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.4078431373, blue: 0.3960784314, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        headerView.addSubview(backArrow)
        headerView.addSubview(editButton)
        
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
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            backArrow.heightAnchor.constraint(equalToConstant: 16),
            backArrow.widthAnchor.constraint(equalToConstant: 20),
            backArrow.topAnchor.constraint(equalTo: headerView.topAnchor),
            backArrow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),

            editButton.heightAnchor.constraint(equalToConstant: 36),
            editButton.widthAnchor.constraint(equalToConstant: 36),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            editButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
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
