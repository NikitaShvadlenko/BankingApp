//
//  TransactionDetailCollecitonManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesTransactionDetailCollection: UICollectionViewDataSource, UICollectionViewDelegate {

}

final class TransactionDetailCollectionViewManager: NSObject {
    var transactions: [TransactionDetailViewModel] = []
}

// MARK: - UICollectionViewDataSource
extension TransactionDetailCollectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        transactions.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(TransactionCollectionViewCell.self)",
            for: indexPath
        ) as? TransactionCollectionViewCell else {
            fatalError("Failed to dequeue cell")
        }
        cell.configure(with: transactions[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TransactionDetailCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return collectionView.frame.size
    }
}
// MARK: - UICollectionViewDelegate
extension TransactionDetailCollectionViewManager {

}

// MARK: - Constants
extension TransactionDetailCollectionViewManager {
    private enum Constants {
        static let leftSectionInset: CGFloat = 20
        static let topSectionInset: CGFloat = 30
        static let verticalSectionInset: CGFloat = 16
        static let collectionViewInsets = UIEdgeInsets(
            top: topSectionInset,
            left: leftSectionInset,
            bottom: verticalSectionInset,
            right: leftSectionInset
        )
    }
}
