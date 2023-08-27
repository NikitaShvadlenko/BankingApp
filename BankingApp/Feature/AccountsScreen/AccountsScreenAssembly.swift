import UIKit

enum AccountsScreenAssembly {
    static func assemble() -> AssembledModule<AccountsScreenModuleInput> {
        let viewController = AccountsScreenViewController()
        let presenter = AccountsScreenPresenter()
        let interactor = AccountsScreenInteractor()
        let router = AccountsScreenRouter()
        let storage = UserDefaultsManager()
        let accountsProvider = AccountsProvider()
        let tableManager = AccountsScreenTableManager()

        viewController.presenter = presenter
        presenter.accountsManager = tableManager
        viewController.setTableViewManager(tableManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.accountProvider = accountsProvider
        interactor.presenter = presenter
        interactor.userSettingsManager = storage

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
