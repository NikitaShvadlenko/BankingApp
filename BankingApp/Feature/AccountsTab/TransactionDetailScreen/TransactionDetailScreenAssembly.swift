import UIKit

enum TransactionDetailScreenAssembly {
    static func assemble(
        transactions: [Transaction], index: Int
    ) -> AssembledModule<TransactionDetailScreenModuleInput> {
        let viewController = TransactionDetailScreenViewController()
        let presenter = TransactionDetailScreenPresenter()
        let interactor = TransactionDetailScreenInteractor()
        let router = TransactionDetailScreenRouter()
        let collectionManager = TransactionDetailCollectionViewManager()

        viewController.presenter = presenter
        viewController.setPageVeiwDelegate(viewController)
        viewController.setCollectionViewManager(manager: collectionManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.transactions = transactions
        presenter.transactionIndex = index
        presenter.collectionManager = collectionManager

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
