import UIKit

enum ServicesScreenAssembly {
    static func assemble() -> AssembledModule<ServicesScreenModuleInput> {
        let viewController = ServicesScreenViewController()
        let presenter = ServicesScreenPresenter()
        let interactor = ServicesScreenInteractor()
        let router = ServicesScreenRouter()

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
