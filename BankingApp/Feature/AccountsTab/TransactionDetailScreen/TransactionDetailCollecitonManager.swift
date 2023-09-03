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

protocol TransactionDetailCollectionManagerCellDelegate: AnyObject {
    func transactionDetailManagerNeedsDelegateForCell(
        _ transactionDetailManager: ManagesTransactionDetailCollection
    ) -> TransactionDetailCellDelegate?
}

final class TransactionDetailCollectionViewManager: NSObject {
    weak var delegate: TransactionDetailCollectionManagerDelegate?
    weak var cellDelegate: TransactionDetailCollectionManagerCellDelegate?
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
        cell.delegate = cellDelegate?.transactionDetailManagerNeedsDelegateForCell(self)
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
        let width = collectionView.bounds.width
        let adjustedContentInset = collectionView.adjustedContentInset
        let height =
        collectionView.bounds.height
        - adjustedContentInset.top
        - Constants.topSectionInset
        - Constants.bottomSectionInset
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
        static let leftSectionInset: CGFloat = 10
        static let topSectionInset: CGFloat = 30
        static let bottomSectionInset: CGFloat = 30
        static let collectionViewInsets = UIEdgeInsets(
            top: topSectionInset,
            left: leftSectionInset,
            bottom: bottomSectionInset,
            right: leftSectionInset
        )
    }
}
