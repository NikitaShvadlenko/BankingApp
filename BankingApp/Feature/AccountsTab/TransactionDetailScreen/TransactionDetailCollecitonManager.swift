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

protocol TransactionDetailCollectionManagerDelegate: AnyObject {
    func transactionDetailManager(_ manager: TransactionDetailCollectionViewManager, didScrollToPageIndex index: Int)
}

final class TransactionDetailCollectionViewManager: NSObject {
    weak var delegate: TransactionDetailCollectionManagerDelegate?
    var transactions: [TransactionDetailViewModel] = []
    private var previousPageIndex: Int = 0
    private var previousContentOffset: CGFloat = 0
}

// MARK: - UICollectionViewDataSource
extension TransactionDetailCollectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transactions.count
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
        let totalWidth = collectionView.bounds.width
        let availibleWidth = totalWidth
        let width = availibleWidth
        let height = collectionView.bounds.height - Constants.topSectionInset * 2
        return CGSize(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return Constants.collectionViewInsets
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0 {
            return
        }
        let pageIndex = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        guard pageIndex != previousPageIndex else { return }
        previousPageIndex = pageIndex
        previousContentOffset = scrollView.contentOffset.x
        delegate?.transactionDetailManager(self, didScrollToPageIndex: pageIndex)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        if pageIndex == transactions.count - 1 && scrollView.contentOffset.x > previousContentOffset {
            let xOffset = CGFloat(pageIndex) * scrollView.frame.width
            scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
        }
    }
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
