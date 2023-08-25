import UIKit

enum PaymentsScreenAssembly {
    static func assemble() -> AssembledModule<PaymentsScreenModuleInput> {
        let viewController = PaymentsScreenViewController()
        let presenter = PaymentsScreenPresenter()
        let interactor = PaymentsScreenInteractor()
        let router = PaymentsScreenRouter()

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
