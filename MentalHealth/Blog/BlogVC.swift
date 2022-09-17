//
//  BlogVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit

struct Blog {
    let text: String
    let image: String
    let user: User
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

    private lazy var collectionView: UICollectionView = {
      let layout = BlogCollectionLayout(
        cellSize: (UIScreen.main.bounds.width) / 10,
        padding: padding / 2
      ).makeLayout()
      let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout
      )
      collectionView.delegate = self
      collectionView.dataSource = self
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      collectionView.register(cell: BlogCollectionViewCell.self)
      collectionView.backgroundColor = .clear
      return collectionView
    }()

//    private lazy var items: []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setup()
    }

    private func setup() {
        setupView()
    }

    private func setupView() {
        setupCollectionView()
    }

    private func setupCollectionView() {

    }
}

extension BlogVC: UICollectionViewDelegate {

}

extension BlogVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
