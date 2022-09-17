//
//  OpportunitiesVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

class OpportunitiesVC: DefaultViewController {

    private let viewModel: OpportunitiesViewModel
    private var currentSection: SectionType = .place { didSet { collectionView.reloadData() } }
    
    enum SectionType: Int {
        case place, vacancy, sales
    }
    
    // MARK: - UI
    private lazy var searchTextField: SearchView = {
        let tf = SearchView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    private lazy var segmentControl: UISegmentedControl = {
        let items = ["Місця", "Вакансії", "Знижки"]
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
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.dataSource = self
        cv.delegate = self
        cv.showsVerticalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 30, right: 0)
        cv.register(cell: PlaceCell.self)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    init(viewModel: OpportunitiesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        titleLabel.text = "Можливості"
        view.backgroundColor = .white
        view.addSubview(searchTextField)
        view.addSubview(segmentControl)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchTextField.heightAnchor.constraint(equalToConstant: 48),
            
            segmentControl.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            segmentControl.heightAnchor.constraint(equalToConstant: 44),
            
            collectionView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    func segmentControlDidSelect(_ sender: UISegmentedControl) {
        guard let newSection = SectionType(rawValue: sender.selectedSegmentIndex) else { return }
        currentSection = newSection
    }

}



// MARK: - UICollectionViewDataSource

extension OpportunitiesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch currentSection {
        case .place: return viewModel.placeData.count
        case .vacancy: return 0
        case .sales: return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch currentSection {
        case .place:
            let cell: PlaceCell = collectionView.dequeueReusableCell(forItemAt: indexPath)
            let place = viewModel.placeData[indexPath.row]
            cell.setupCell(place: place)
            return cell
        case .vacancy:
            let cell: PlaceCell = collectionView.dequeueReusableCell(forItemAt: indexPath)
            cell.backgroundColor = .red
            return cell
        case .sales:
            let cell: PlaceCell = collectionView.dequeueReusableCell(forItemAt: indexPath)
            cell.backgroundColor = .red
            return cell
        }
    }
    
}

extension OpportunitiesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewSize = collectionView.frame.size
        return CGSize(width: viewSize.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }


}


