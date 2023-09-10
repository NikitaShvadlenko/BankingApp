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
        setBackButtonAppearance()
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
// MARK: - Private Methods
extension AppDelegate {
    private func createTabBarController() -> TabBarController {
        let tabBarController = TabBarController()
        var viewControllers = [UIViewController]()
        let tabBarItemTypes = TabBarItemType.allCases

        for tabBarItemType in tabBarItemTypes {
            let viewController = TabBarItemFactory.viewController(for: tabBarItemType)
            viewControllers.append(viewController)
        }
        tabBarController.setViewControllers(viewControllers, animated: false)
        return tabBarController
    }

    private func setBackButtonAppearance() {
        UINavigationBar.appearance().backIndicatorImage = UIImage(sfSymbol: SFSymbol.back)
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(sfSymbol: SFSymbol.back)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Asset.Colors.viewTitle.color,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)
        ]
    }
}
