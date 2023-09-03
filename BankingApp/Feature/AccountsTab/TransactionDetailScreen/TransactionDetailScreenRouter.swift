import UIKit

final class TransactionDetailScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: TransactionDetailScreenRouterOutput?
}

// MARK: - TransactionDetailScreenRouterInput
extension TransactionDetailScreenRouter: TransactionDetailScreenRouterInput {
    func routeToShareTransactionViewController(transaction: TransactionDetailViewModel) {
        viewController?
            .navigationController?
            .pushViewController(
                TransactionDetailShareViewController(model: transaction),
                animated: true
            )
    }
}

// MARK: - Private methods
extension TransactionDetailScreenRouter {
}
