import UIKit

final class ServicesScreenViewController: UIViewController {

    private let servicesScreenView = ServicesScreenView()
    var collectionViewManager: ManagesMenuCollection?

    override func loadView() {
        view = servicesScreenView
    }
}

// MARK: - Private methods
extension ServicesScreenViewController {
    private func setMenuItems() {
       guard
        let cardApplicationSymbol = UIImage(sfSymbol: SFSymbol.cardApplication),
        let viewCardsSymbol = UIImage(sfSymbol: SFSymbol.card) else {
           return
       }
        let menuItems = [
            MenuItemViewModel(
                title: L10n.ServicesScreen.applyForCard,
                image: cardApplicationSymbol,
                action: { [weak self] in
                    guard let self else { return }

                }
            ),
            MenuItemViewModel(
                title: L10n.ServicesScreen.viewCards,
                image: viewCardsSymbol,
                action: { [weak self] in
                    guard let self else { return }

                }
            )
        ]
        collectionViewManager?.setViewModel(menuItems)
    }
}
