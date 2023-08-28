import UIKit

enum AccountDetailScreenAssembly {
    static func assemble(account: Account, imageData: Data?) -> AssembledModule<AccountDetailScreenModuleInput> {
        let viewController = AccountDetailScreenViewController()
        let presenter = AccountDetailScreenPresenter()
        let interactor = AccountDetailScreenInteractor()
        let router = AccountDetailScreenRouter()

        viewController.presenter = presenter

        presenter.accountImage = imageData
        presenter.account = account
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
