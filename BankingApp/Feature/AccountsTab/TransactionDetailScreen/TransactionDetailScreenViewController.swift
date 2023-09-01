import UIKit

final class TransactionDetailScreenViewController: UIViewController {

    private let transactionDetailScreenView = TransactionDetailScreenView()

    var presenter: TransactionDetailScreenViewOutput?
    var selectedPage: Int?

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

    override func viewDidLayoutSubviews() {
        if let selectedPage {
            let collectionView = transactionDetailScreenView.transactionsCollectionView
            let xOffset = CGFloat(selectedPage) * collectionView.frame.width
            collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
        }
        super.viewDidLayoutSubviews()
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
    func configurePagingView(pagesTotal: Int) {
        transactionDetailScreenView.pageView.configureView(totalPages: pagesTotal, currentPage: 0)
    }

    func configureTransactionView(selectedTransactionIndex: Int) {

    }

    func configureViews() {
    }
}

// MARK: - Private methods
extension TransactionDetailScreenViewController {
}
