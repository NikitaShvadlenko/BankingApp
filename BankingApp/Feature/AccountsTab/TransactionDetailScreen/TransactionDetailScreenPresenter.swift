import Foundation

final class TransactionDetailScreenPresenter {
    weak var view: TransactionDetailScreenViewInput?
    weak var moduleOutput: TransactionDetailScreenModuleOutput?
    var interactor: TransactionDetailScreenInteractorInput?
    var router: TransactionDetailScreenRouterInput?
    var collectionManager: ManagesTransactionDetailCollection?
    var transactions: [Transaction]?
    var transactionIndex: Int?
}

// MARK: - TransactionDetailScreenViewOutput
extension TransactionDetailScreenPresenter: TransactionDetailScreenViewOutput {
    func viewDidLoad(_ view: TransactionDetailScreenViewInput) {
        view.configureViews()
        setTransactions()
        if let transactionIndex = transactionIndex {
            view.configureTransactionView(selectedTransactionIndex: transactionIndex)
        }

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
            date: transaction.dateProcessed,
            type: transaction.transactionType.rawValue,
            cardNumber: transaction.transactionDetails.detail,
            balanceAfterTransaction: transaction.transactionDetails.balanceAfterTransaction
        )
        return transactionViewModel
    }

}
