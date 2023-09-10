import UIKit

enum AccountsScreenAssembly {
    static func assemble() -> UIViewController{
        let viewController = AccountsScreenViewController()
        let presenter = AccountsScreenPresenter()
        let interactor = AccountsScreenInteractor()
        let router = AccountsScreenRouter()
        let storage = UserDefaultsManager()
        let accountsProvider = AccountsProvider()
        let tableManager = AccountsScreenTableManager()
        let placeholderStore = PlaceholderStore()
        let imageDownloader = AccountsSessionApi(session: Session())

        viewController.presenter = presenter
        presenter.accountsManager = tableManager
        tableManager.delegate = presenter

        viewController.setTableViewManager(tableManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.imageDownloader = imageDownloader
        interactor.placeholderStore = placeholderStore
        interactor.accountProvider = accountsProvider
        interactor.presenter = presenter
        interactor.userSettingsManager = storage

        router.viewController = viewController
        router.presenter = presenter

        return viewController
    }
}
