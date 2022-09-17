//
//  QuizVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit
import CombineCocoa
import Combine

class QuizVC: DefaultViewController {
    
    private let viewModel: QuizViewModel
    private var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: QuizViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "1/7"
        label.font = UIFont.mainLight()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Чи буває вам важко заснути?"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.mainRegular(size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .none
        tv.rowHeight = 56
        tv.register(QuizCell.self)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Наступне питання", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(countLabel)
        view.addSubview(label)
        view.addSubview(tableView)
        view.addSubview(nextButton)
        setupBackArrow()
        
        NSLayoutConstraint.activate([
            countLabel.centerYAnchor.constraint(equalTo: backArrow.centerYAnchor),
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            tableView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            nextButton.heightAnchor.constraint(equalToConstant: 48),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
    
    func setupBackArrow() {
        backArrow.isHidden = false
        backArrow.tapPublisher
            .sink { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
            .store(in: &cancellableSet)
        
        tableView.didSelectRowPublisher.sink { index in
            print(index)
        }
        .store(in: &cancellableSet)
    }

}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension QuizVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: QuizCell = tableView.dequeueReusableCell(forItemAt: indexPath)
        cell.setupCell(text: "Зовсім ні", isSelected: viewModel.selectedCell == indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedCell = indexPath
        tableView.reloadData()
        print(indexPath.row)
    }
    
    
}

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
