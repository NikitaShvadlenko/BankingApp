import Foundation

final class TransactionDetailScreenPresenter {
    weak var view: TransactionDetailScreenViewInput?
    weak var moduleOutput: TransactionDetailScreenModuleOutput?
    var interactor: TransactionDetailScreenInteractorInput?
    var router: TransactionDetailScreenRouterInput?
    var collectionManager: ManagesTransactionDetailCollection?
    var transactions: [Transaction]?
    var initialPage: Int?
}

// MARK: - TransactionDetailScreenViewOutput
extension TransactionDetailScreenPresenter: TransactionDetailScreenViewOutput {
    func viewDidTapShareLabel(_ view: TransactionDetailScreenViewInput, transaction: TransactionDetailViewModel) {
        router?.routeToShareTransactionViewController(transaction: transaction)
    }

    func viewDidLoad(_ view: TransactionDetailScreenViewInput) {
        setTransactions()
        guard
            let transactions,
            let initialPage
        else { return }
        view.configureViews(selectedPage: initialPage, pagesTotal: transactions.count)
    }
}

// MARK: - TransactionDetailScreenInteractorOutput
extension TransactionDetailScreenPresenter: TransactionDetailScreenInteractorOutput {
}

// MARK: - TransactionDetailScreenRouterOutput
extension TransactionDetailScreenPresenter: TransactionDetailScreenRouterOutput {
}

// MARK: - TransactionDetailScreenModuleInput
extension TransactionDetailScreenPresenter: TransactionDetailScreenModuleInput {
    func configureModule(output: TransactionDetailScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - TransactionDetailCollectionManagerDelegate
extension TransactionDetailScreenPresenter: TransactionDetailCollectionManagerDelegate {
    func transactionDetailManager(_ manager: TransactionDetailCollectionViewManager, didScrollToPageIndex index: Int) {
        view?.configurePagingView(selectedPage: index + 1)
    }
}
// MARK: - Private methods
extension TransactionDetailScreenPresenter {
   private func setTransactions() {
        guard let transactions = transactions else { return }
        var result: [TransactionDetailViewModel] = []
        for transation in transactions {
            let transactionViewModel = viewModel(from: transation)
            result.append(transactionViewModel)
        }
         collectionManager?.setTransactions(transactions: result)
    }

    private func viewModel(from transaction: Transaction) -> TransactionDetailViewModel {
        let transactionViewModel = TransactionDetailViewModel(
            name: transaction.sentToAccount,
            amount: transaction.amount,
            date: transaction.dateSent,
            dateProcessed: transaction.dateProcessed,
            type: transaction.transactionType.rawValue,
            cardNumber: transaction.transactionDetails.detail,
            balanceAfterTransaction: transaction.transactionDetails.balanceAfterTransaction
        )
        return transactionViewModel
    }

}
