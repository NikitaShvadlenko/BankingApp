//
//  TransactionDetailCollecitonManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesTransactionDetailCollection: UICollectionViewDataSource, UICollectionViewDelegate {
    func setTransactions(transactions: [TransactionDetailViewModel])
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
        let totalWidth = collectionView.bounds.width - Constants.leftSectionInset * 2
        let availibleWidth = totalWidth - (Constants.spaceBetweenCards * (Constants.numberOfHorizontalCards - 1))
        let width = availibleWidth / Constants.numberOfHorizontalCards
        let height = width * 1.3
        return CGSize(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: Constants.verticalSectionInset,
            left: Constants.leftSectionInset,
            bottom: Constants.verticalSectionInset,
            right: Constants.leftSectionInset
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        Constants.spaceBetweenCards
    }

}

// MARK: - ManagesTransactionDetailCollection
extension TransactionDetailCollectionViewManager: ManagesTransactionDetailCollection {
    func setTransactions(transactions: [TransactionDetailViewModel]) {
        self.transactions = transactions
    }
}

// MARK: - UICollectionViewDelegate
extension TransactionDetailCollectionViewManager: UICollectionViewDelegate {

}

// MARK: - Constants
extension TransactionDetailCollectionViewManager {
    private enum Constants {
        static let numberOfHorizontalCards: CGFloat = 1
        static let spaceBetweenCards: CGFloat = 20
        static let leftSectionInset: CGFloat = 10
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
