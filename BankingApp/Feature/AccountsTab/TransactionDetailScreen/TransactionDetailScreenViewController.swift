import UIKit

final class TransactionDetailScreenViewController: UIViewController {

    private let transactionDetailScreenView = TransactionDetailScreenView()

    var presenter: TransactionDetailScreenViewOutput?

    override func loadView() {
        view = transactionDetailScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setPageVeiwDelegate(_ delegate: TransactoinPagingViewDelegate) {
        transactionDetailScreenView.pageView.delegate = delegate
    }

    func setCollectionViewManager(manager: ManagesTransactionDetailCollection) {
        transactionDetailScreenView.transactionsCollectionView.dataSource = manager
        transactionDetailScreenView.transactionsCollectionView.delegate = manager
    }
}

// MARK: - TransactoinPagingViewDelegate
extension TransactionDetailScreenViewController: TransactoinPagingViewDelegate {
    func transacitonPagingViewDidTapForwardButton(_ transactionPagingView: TransactionPagingView) {
        print("Forward Tapped")
    }

    func transacitonPagingViewDidTapBackButton(_ transactionPagingView: TransactionPagingView) {
        print("Back Tapped")
    }
}

// MARK: - TransactionDetailScreenViewInput
extension TransactionDetailScreenViewController: TransactionDetailScreenViewInput {
    func configurePagingView(pageSelected: Int, pagesTotal: Int) {
        transactionDetailScreenView.pageView.configureView(totalPages: pagesTotal, currentPage: pageSelected)
    }

    func configureTransactionView(selectedTransactionIndex: Int) {
        transactionDetailScreenView.transactionsCollectionView.scrollToPage(pageNumber: selectedTransactionIndex)
    }

    func configureViews() {
    }
}

// MARK: - Private methods
extension TransactionDetailScreenViewController {
}
