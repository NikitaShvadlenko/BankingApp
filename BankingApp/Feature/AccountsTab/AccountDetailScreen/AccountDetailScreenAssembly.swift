import UIKit

enum AccountDetailScreenAssembly {
    static func assemble(account: Account, imageData: Data?) -> UIViewController {
        let viewController = AccountDetailScreenViewController()
        let presenter = AccountDetailScreenPresenter()
        let interactor = AccountDetailScreenInteractor()
        let router = AccountDetailScreenRouter()
        let transactionsTableManager = TransactionsTableViewManager()

        viewController.presenter = presenter
        viewController.setAccountsViewDelegate()
        viewController.setTableViewManager(transactionsTableManager)
        presenter.accountImage = imageData
        presenter.account = account
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.tableViewManager = transactionsTableManager
        transactionsTableManager.delegate = presenter

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return viewController
    }
}
