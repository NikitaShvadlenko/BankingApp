import UIKit

final class AccountDetailScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: AccountDetailScreenRouterOutput?
}

// MARK: - AccountDetailScreenRouterInput
extension AccountDetailScreenRouter: AccountDetailScreenRouterInput {
    func routeToTransactionsScreen(transactions: [Transaction]) {
        let transactionDetailViewController = TransactionDetailScreenAssembly
            .assemble(
                transactions: transactions
            ).viewController
        viewController?.navigationController?.pushViewController(transactionDetailViewController, animated: true)
    }
}

// MARK: - Private methods
extension AccountDetailScreenRouter {
}
