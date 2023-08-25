import UIKit

enum TransferScreenAssembly {
    static func assemble() -> AssembledModule<TransferScreenModuleInput> {
        let viewController = TransferScreenViewController()
        let presenter = TransferScreenPresenter()
        let interactor = TransferScreenInteractor()
        let router = TransferScreenRouter()

        viewController.presenter = presenter

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
