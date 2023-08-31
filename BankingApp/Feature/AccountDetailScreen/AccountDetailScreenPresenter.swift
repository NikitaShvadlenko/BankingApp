import Foundation

final class AccountDetailScreenPresenter {
    weak var view: AccountDetailScreenViewInput?
    weak var moduleOutput: AccountDetailScreenModuleOutput?
    var interactor: AccountDetailScreenInteractorInput?
    var router: AccountDetailScreenRouterInput?
    var account: Account?
    var accountImage: Data?
    var tableViewManager: ManagesTransactionsTableView?
}

// MARK: - AccountDetailScreenViewOutput
extension AccountDetailScreenPresenter: AccountDetailScreenViewOutput {
    func viewDidSearch(_ view: AccountDetailScreenViewInput, text: String) {
        guard let account else { return }
        guard !text.isEmpty else {
            tableViewManager?.setTransacrtions(account.transactions)
            return
        }
        let transactions = filteredTransactions(with: text, for: account)
        tableViewManager?.setTransacrtions(transactions)
    }

    func viewDidLoad(_ view: AccountDetailScreenViewInput) {
        view.configureViews()
        if let account = account {
            view.setNavigationBarTitle(newTitle: account.name)
        }
        setAccount()
        setTransactions()
    }
}

// MARK: - TransactionsTableViewManagerDelegate
extension AccountDetailScreenPresenter: TransactionsTableViewManagerDelegate {
    func transactionsTableViewManager(
        _ transactionsTableViewManager: ManagesTransactionsTableView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Route to the Detail Transaction View")
    }
}

// MARK: - AccountDetailScreenInteractorOutput
extension AccountDetailScreenPresenter: AccountDetailScreenInteractorOutput {
}

// MARK: - AccountDetailScreenRouterOutput
extension AccountDetailScreenPresenter: AccountDetailScreenRouterOutput {
}

// MARK: - AccountDetailScreenModuleInput
extension AccountDetailScreenPresenter: AccountDetailScreenModuleInput {
    func configureModule(output: AccountDetailScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension AccountDetailScreenPresenter {
    private func accountViewModel(from account: Account, image: Data) -> AccountViewModel {
        return AccountViewModel(
            image: image,
            amount: account.amount,
            availible: account.availible,
            accountNumber: account.number,
            accountType: account.type.rawValue,
            accountName: account.accountName
        )
    }

    private func filteredTransactions(with filter: String = "", for account: Account) -> [Transaction] {
        let filteredTransactions = account.transactions.filter { $0.sentToAccount.contains(filter) }
        return filteredTransactions
    }

    private func setAccount() {
        guard let account,
              let accountImage
        else { return }
        let viewModel = accountViewModel(from: account, image: accountImage)
        view?.setAccountView(with: viewModel)
    }

    private func setTransactions() {
        guard let account else { return }
        tableViewManager?.setTransacrtions(account.transactions)
    }
}
