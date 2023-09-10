import UIKit

final class AccountsScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: AccountsScreenRouterOutput?
}

// MARK: - AccountsScreenRouterInput
extension AccountsScreenRouter: AccountsScreenRouterInput {

    func routeToAccontDetailScreen(
        for account: Account, imageData: Data?
    ) {
        let accountDetailView = AccountDetailScreenAssembly.assemble(
            account: account, imageData: imageData
        )
        viewController?.navigationController?.pushViewController(accountDetailView, animated: true)
    }
}

// MARK: - Private methods
extension AccountsScreenRouter {
}
