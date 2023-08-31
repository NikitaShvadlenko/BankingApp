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
    func configureViews() {
    }
}

// MARK: - Private methods
extension TransactionDetailScreenViewController {
}
