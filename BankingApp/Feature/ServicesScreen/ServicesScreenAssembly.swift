import UIKit

enum ServicesScreenAssembly {
    static func assemble() -> UIViewController {
        let viewController = ServicesScreenViewController()
        let router = ServicesScreenRouter()

        return viewController
    }
}
