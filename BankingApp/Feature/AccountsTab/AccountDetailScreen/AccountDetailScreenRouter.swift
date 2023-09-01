import UIKit

final class AccountDetailScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: AccountDetailScreenRouterOutput?
}

// MARK: - AccountDetailScreenRouterInput
extension AccountDetailScreenRouter: AccountDetailScreenRouterInput {
    func routeToTransactionsScreen(transactions: [Transaction], index: Int) {
        let transactionDetailViewController = TransactionDetailScreenAssembly
            .assemble(
                transactions: transactions,
                index: index
            ).viewController
        viewController?.navigationController?.pushViewController(transactionDetailViewController, animated: true)
    }
}

// MARK: - Private methods
extension AccountDetailScreenRouter {
}
