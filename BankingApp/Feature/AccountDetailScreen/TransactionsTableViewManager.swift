//
//  TransactionsTableViewManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 29.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesTransactionsTableView: UITableViewDelegate {
    var dataSource: UITableViewDiffableDataSource<Date, Transaction> { get }
    var transactions: [Transaction] { get }
    func setScrollDelegate(_ scrollDelegate: TransactionsTableViewManagerScrollDelegate)
    func setTransacrtions(_ transactions: [Transaction])
    func setTableView(_ tableView: UITableView)
}

protocol TransactionsTableViewManagerDelegate: AnyObject {
    func transactionsTableViewManager(
        _ transactionsTableViewManager: ManagesTransactionsTableView,
        didSelectItemAt indexPath: IndexPath
    )
}

protocol TransactionsTableViewManagerScrollDelegate: AnyObject {
    func transactionsTableScrollView(
        _ transactionsTableScrollView: UIScrollView,
        didScrollTo offsetY: CGFloat
    )
}

final class TransactionsTableViewManager: NSObject {
    var sortedDates: [Date] = []
    weak var delegate: TransactionsTableViewManagerDelegate?
    weak var tableView: UITableView?
    weak var scrollDelegate: TransactionsTableViewManagerScrollDelegate?
    var transactions: [Transaction] = [] {
        didSet {
            configureSnapshot()
        }
    }

    lazy var dataSource: UITableViewDiffableDataSource<Date, Transaction> = {
        guard let tableView = self.tableView else {
            fatalError("CollectionView was not set")
        }

        return UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(TransactionTableViewCell.self)",
                for: indexPath) as? TransactionTableViewCell
            else { fatalError("Failed to deque cell") }
            cell.configure(name: itemIdentifier.sentToAccount, amount: itemIdentifier.amount)
            return cell
        }
    }()
}

extension TransactionsTableViewManager: ManagesTransactionsTableView {
    func setScrollDelegate(_ scrollDelegate: TransactionsTableViewManagerScrollDelegate) {
        self.scrollDelegate = scrollDelegate
    }

    func setTableView(_ tableView: UITableView) {
        self.tableView = tableView
    }

    func setTransacrtions(_ transactions: [Transaction]) {
        self.transactions = transactions
    }

}
// MARK: - UITableViewDelegate
extension TransactionsTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.transactionsTableViewManager(self, didSelectItemAt: indexPath)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "\(TransactionsTableHeader.self)"
        ) as? TransactionsTableHeader else {
            fatalError("Failed to dequeue header")
        }
        header.configure(date: sortedDates[section])
        return header
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.transactionsTableScrollView(scrollView, didScrollTo: scrollView.contentOffset.y)
    }
}

// MARK: - Private Methods
extension TransactionsTableViewManager {
    private func configureSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Date, Transaction>()
        let groupedItems = Dictionary(
            grouping: transactions,
            by: { Calendar.current.startOfDay(for: $0.dateProcessed) }
        )
        let sortedDates = groupedItems.keys.sorted()
        self.sortedDates.append(contentsOf: sortedDates)
        for date in sortedDates {
            if let itemsForDate = groupedItems[date] {
                snapshot.appendSections([date])
                snapshot.appendItems(itemsForDate, toSection: date)
            }
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
