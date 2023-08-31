import UIKit

enum TransactionDetailScreenAssembly {
    static func assemble(transactions: [Transaction]) -> AssembledModule<TransactionDetailScreenModuleInput> {
        let viewController = TransactionDetailScreenViewController()
        let presenter = TransactionDetailScreenPresenter()
        let interactor = TransactionDetailScreenInteractor()
        let router = TransactionDetailScreenRouter()

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
