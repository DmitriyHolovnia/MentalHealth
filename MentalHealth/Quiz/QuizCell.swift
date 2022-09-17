//
//  QuizCell.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class QuizCell: UITableViewCell, ReusableCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 24
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainLight()
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    func setupCell(text: String, isSelected: Bool) {
        label.text = text
        containerView.backgroundColor = isSelected ? .lightGreen : .white
    }
    
    func setupUI() {
        addSubview(containerView)
        addSubview(label)
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 48),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
}
