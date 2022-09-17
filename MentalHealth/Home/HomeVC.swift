//
//  HomeVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class HomeVC: DefaultViewController {

    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isUserInteractionEnabled = true
        return scroll
    }()
    private let firstCard = CardView(
        height: 134,
        title: "Як почуваєшся?",
        subtitle: "Заповни свій щоденник самопочуття",
        image: "alive-star"
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
    private lazy var instructionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        instructionViews.forEach( { stack.addArrangedSubview($0) } )
        return stack
    }()
    private var instructionViews: [InstructionView] {
        return [
            .init(title: "Проблеми з близькими", image: "hands"),
            .init(title: "Проблеми зі сном", image: "pillow"),
            .init(title: "Тривога та стрес", image: "bubble")
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Головна"
        titleLabel.text = "Головна"
        setup()
    }

    private func setup() {
        editButton.isHidden = false
        editButton.setImage(UIImage(named: "bell"), for: .normal)
        view.addSubview(scrollView, constraints: [
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        scrollView.addSubview(firstCard, constraints: [
            firstCard.topAnchor.constraint(equalTo: scrollView.topAnchor),
            firstCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            firstCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24)
        ])
        scrollView.addSubview(sectionLabel, constraints: [
            sectionLabel.topAnchor.constraint(equalTo: firstCard.bottomAnchor, constant: 32),
            sectionLabel.leadingAnchor.constraint(equalTo: firstCard.leadingAnchor)
        ])
        scrollView.addSubview(secondCard, constraints: [
            secondCard.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 16),
            secondCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            secondCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24)
        ])
        scrollView.addSubview(dotsStack, constraints: [
            dotsStack.topAnchor.constraint(equalTo: secondCard.bottomAnchor, constant: 12),
            dotsStack.heightAnchor.constraint(equalToConstant: 6),
            dotsStack.widthAnchor.constraint(equalToConstant: 40),
            dotsStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        scrollView.addSubview(instructionsLabel, constraints: [
            instructionsLabel.topAnchor.constraint(equalTo: dotsStack.bottomAnchor, constant: 32),
            instructionsLabel.leadingAnchor.constraint(equalTo: firstCard.leadingAnchor)
        ])
        scrollView.addSubview(instructionStack, constraints: [
            instructionStack.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 16),
            instructionStack.leadingAnchor.constraint(equalTo: firstCard.leadingAnchor),
            instructionStack.trailingAnchor.constraint(equalTo: firstCard.trailingAnchor),
            instructionStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            instructionStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])
    }
}
