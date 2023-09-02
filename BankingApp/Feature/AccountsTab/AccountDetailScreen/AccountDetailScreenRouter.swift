import UIKit

final class AccountDetailScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: AccountDetailScreenRouterOutput?
}

// MARK: - AccountDetailScreenRouterInput
extension AccountDetailScreenRouter: AccountDetailScreenRouterInput {
    func presentShareScreen(shareString: String) {
        let activityViewController = UIActivityViewController(activityItems: [shareString], applicationActivities: nil)
        guard let viewController else { return }
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = viewController.view
            popoverController.sourceRect = viewController.view.bounds
        }

        viewController.present(activityViewController, animated: true)
    }

    func routeToTransactionsScreen(transactions: [Transaction], index: Int) {

        let transactionDetailViewController = TransactionDetailScreenAssembly
            .assemble(
                transactions: transactions,
                index: index
            ).viewController
        transactionDetailViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(transactionDetailViewController, animated: true)
    }
}

// MARK: - Private methods
extension AccountDetailScreenRouter {
}
