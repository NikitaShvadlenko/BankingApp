//
//  MenuCollectionViewManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 04.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesMenuCollection: UICollectionViewDataSource, UICollectionViewDelegate {
    func setViewModel(_ viewModel: [MenuItemViewModel])
}

final class MenuCollectionViewManager: NSObject {
    var viewModel: [MenuItemViewModel] = []
}

// MARK: - ManagesMenuCollection
extension MenuCollectionViewManager: ManagesMenuCollection {
    func setViewModel(_ viewModel: [MenuItemViewModel]) {
        self.viewModel = viewModel
    }
}

// MARK: - UICollectionViewDataSource
extension MenuCollectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(MenuItemCell.self)", for: indexPath
        ) as? MenuItemCell else {
            fatalError("Failed to dequeue cell")
        }
        let item = viewModel[indexPath.row]
        cell.configure(title: item.title, image: item.image)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MenuCollectionViewManager: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard indexPath.row < viewModel.count else {
            return
        }
        viewModel[indexPath.row].action()
    }
}
