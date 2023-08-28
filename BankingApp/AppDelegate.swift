import UIKit
import FirebaseCore
import FirebaseFirestore

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = createTabBarController()

        window.rootViewController = tabBarController
        FirebaseApp.configure()
        _ = Firestore.firestore()
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
// MARK: - Private Methods
extension AppDelegate {
    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        var viewControllers = [UIViewController]()
        let tabBarItemTypes = TabBarItemType.allCases

        for tabBarItemType in tabBarItemTypes {
            let viewController = TabBarItemFactory.viewController(for: tabBarItemType)
            viewControllers.append(viewController)
        }

        tabBarController.setViewControllers(viewControllers, animated: false)

        return tabBarController
    }
}
