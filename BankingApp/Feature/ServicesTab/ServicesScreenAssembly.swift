import UIKit

enum ServicesScreenAssembly {
    static func assemble() -> UIViewController {
        let collectionViewManager = MenuCollectionViewManager()
        let viewController = ServicesScreenViewController(collectionManager: collectionViewManager)
        let applyForCardCoordinator = OpenAccountCoordinatorAssembly.assemble(
            parentViewController: viewController
        )
        viewController.applyForCardCoordinator = applyForCardCoordinator
        viewController.setCloseButtonDelegate(viewController)

        return viewController
    }
}
