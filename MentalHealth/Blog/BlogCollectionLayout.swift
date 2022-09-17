//
//  BlogCollectionLayout.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit

class BlogCollectionLayout {
  private let cellSize: CGFloat
  private let padding: CGFloat

  init(
    cellSize: CGFloat = (UIScreen.main.bounds.width - 16) / 6,
    padding: CGFloat = 8.0
  ) {
    self.cellSize = cellSize
    self.padding = padding
  }

  public func makeLayout() -> UICollectionViewLayout {
    let configuration = UICollectionViewCompositionalLayoutConfiguration()
    configuration.scrollDirection = .horizontal
    return UICollectionViewCompositionalLayout(
      sectionProvider: { section, environment in
        self.makeDeviceModeSectionLayout()
      },
      configuration: configuration
    )
  }

  private func makeDeviceModeSectionLayout() -> NSCollectionLayoutSection {
    // item
    let itemSize: NSCollectionLayoutSize = .init(
      widthDimension: .estimated(cellSize),
      heightDimension: .estimated(cellSize)
    )
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = .init(
      top: padding,
      leading: padding,
      bottom: padding,
      trailing: padding
    )
    // group
    let height: CGFloat = cellSize
    let groupSize: NSCollectionLayoutSize = .init(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .absolute(height))
    let group = NSCollectionLayoutGroup.horizontal(
      layoutSize: groupSize,
      subitems: [item])
//    group.contentInsets = .init(
//      top: padding,
//      leading: padding,
//      bottom: padding,
//      trailing: padding
//    )
    group.interItemSpacing = .flexible(padding)
    // section
    let section = NSCollectionLayoutSection(group: group)
    return section
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
