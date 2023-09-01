import UIKit

final class TransactionDetailScreenViewController: UIViewController {

    private let transactionDetailScreenView = TransactionDetailScreenView()

    var presenter: TransactionDetailScreenViewOutput?
    var initialPage: Int?
    var totalPages = 0

    override func loadView() {
        view = transactionDetailScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setPageVeiwDelegate(_ delegate: TransactionPagingViewDelegate) {
        transactionDetailScreenView.pageView.delegate = delegate
    }

    func setCollectionViewManager(manager: ManagesTransactionDetailCollection) {
        transactionDetailScreenView.transactionsCollectionView.dataSource = manager
        transactionDetailScreenView.transactionsCollectionView.delegate = manager
    }

    override func viewDidLayoutSubviews() {
        if let initialPage {
            let collectionView = transactionDetailScreenView.transactionsCollectionView
            let xOffset = CGFloat(initialPage) * collectionView.frame.width
            collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: false)
            self.initialPage = nil
        }
        super.viewDidLayoutSubviews()
    }

}

// MARK: - TransactoinPagingViewDelegate
extension TransactionDetailScreenViewController: TransactionPagingViewDelegate {
    func transacitonPagingViewDidTapForwardButton(_ transactionPagingView: TransactionPagingView) {
        let collectionView = transactionDetailScreenView.transactionsCollectionView
        let collectionViewWidth = collectionView.frame.width
        let currentPageIndex = Int(collectionView.contentOffset.x / collectionViewWidth)
        collectionView.scrollToPage(pageNumber: currentPageIndex + 1, animated: true)
    }

    func transacitonPagingViewDidTapBackButton(_ transactionPagingView: TransactionPagingView) {
        let collectionView = transactionDetailScreenView.transactionsCollectionView
        let collectionViewWidth = collectionView.frame.width
        let currentPageIndex = Int(collectionView.contentOffset.x / collectionViewWidth)
        collectionView.scrollToPage(pageNumber: currentPageIndex - 1, animated: true)
    }
}

// MARK: - TransactionDetailScreenViewInput
extension TransactionDetailScreenViewController: TransactionDetailScreenViewInput {
    func configurePagingView(selectedPage: Int) {
        transactionDetailScreenView.pageView.configureView(totalPages: totalPages, currentPage: selectedPage)
    }

    func configureViews(selectedPage: Int, pagesTotal: Int) {
        self.initialPage = selectedPage
        self.totalPages = pagesTotal
        configurePagingView(selectedPage: selectedPage + 1)
    }
}

// MARK: - Private methods
extension TransactionDetailScreenViewController {
}
