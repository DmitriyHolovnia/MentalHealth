//
//  HomeVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class HomeVC: DefaultViewController {

    private let firstCard = CardView(
        height: 134,
        title: "Як почуваєшся?",
        subtitle: "Заповни свій щоденник самопочуття",
        image: "star"
    )
    private lazy var sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainRegular(size: 16)
        label.textColor = .black
        label.text = title
        label.text = "Рекомендуємо"
        return label
    }()
    private let secondCard = CardView(
        height: 134,
        title: "Розслабляюча дихальна вправа?",
        subtitle: "",
        image: "rain",
        showTime: true,
        fontSize: 14
    )
    private let dotsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        let colors = [UIColor.darkGreen, UIColor.lightGray, UIColor.lightGray]
        for color in colors {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: 6))
            view.layer.cornerRadius = 3
            view.backgroundColor = color
            stack.addArrangedSubview(view)
        }
        return stack
    }()
    private lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainRegular(size: 16)
        label.textColor = .black
        label.text = title
        label.text = "Інструкції"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Головна"
        titleLabel.text = "Головна"

        setup()
    }

    private func setup() {
        view.addSubview(firstCard, constraints: [
            firstCard.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            firstCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            firstCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        view.addSubview(sectionLabel, constraints: [
            sectionLabel.topAnchor.constraint(equalTo: firstCard.bottomAnchor, constant: 32),
            sectionLabel.leadingAnchor.constraint(equalTo: firstCard.leadingAnchor)
        ])
        view.addSubview(secondCard, constraints: [
            secondCard.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 16),
            secondCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            secondCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        view.addSubview(dotsStack, constraints: [
            dotsStack.topAnchor.constraint(equalTo: secondCard.bottomAnchor, constant: 12),
            dotsStack.heightAnchor.constraint(equalToConstant: 6),
            dotsStack.widthAnchor.constraint(equalToConstant: 40),
            dotsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        view.addSubview(instructionsLabel, constraints: [
            instructionsLabel.topAnchor.constraint(equalTo: dotsStack.bottomAnchor, constant: 32),
            instructionsLabel.leadingAnchor.constraint(equalTo: firstCard.leadingAnchor)
        ])
    }
}
