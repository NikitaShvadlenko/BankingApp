import Foundation

final class TransactionDetailScreenPresenter {
    weak var view: TransactionDetailScreenViewInput?
    weak var moduleOutput: TransactionDetailScreenModuleOutput?
    var interactor: TransactionDetailScreenInteractorInput?
    var router: TransactionDetailScreenRouterInput?
    var transactions: [Transaction]?
    var transactionIndex: Int?
}

// MARK: - TransactionDetailScreenViewOutput
extension TransactionDetailScreenPresenter: TransactionDetailScreenViewOutput {
    func viewDidLoad(_ view: TransactionDetailScreenViewInput) {
        view.configureViews()
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
}
