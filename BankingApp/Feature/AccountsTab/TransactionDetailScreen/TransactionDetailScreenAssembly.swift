import UIKit

enum TransactionDetailScreenAssembly {
    static func assemble(
        transactions: [Transaction], index: Int
    ) -> UIViewController {
        let viewController = TransactionDetailScreenViewController()
        let presenter = TransactionDetailScreenPresenter()
        let interactor = TransactionDetailScreenInteractor()
        let router = TransactionDetailScreenRouter()
        let collectionManager = TransactionDetailCollectionViewManager()

        collectionManager.cellDelegate = viewController
        presenter.initialPage = index
        collectionManager.delegate = presenter
        presenter.transactions = transactions
        presenter.collectionManager = collectionManager
        viewController.setCollectionViewManager(manager: collectionManager)
        viewController.presenter = presenter
        viewController.setPageVeiwDelegate(viewController)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return viewController
    }
}
