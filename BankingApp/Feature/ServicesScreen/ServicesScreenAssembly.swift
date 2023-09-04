import UIKit

enum ServicesScreenAssembly {
    static func assemble() -> UIViewController {
        let collectionViewManager = MenuCollectionViewManager()
        let viewController = ServicesScreenViewController(collectionManager: collectionViewManager)
        let applyForCardCoordinator = ApplyForCardCoordinator(parentViewController: viewController)
        viewController.applyForCardCoordinator = applyForCardCoordinator
        return viewController
    }
}
