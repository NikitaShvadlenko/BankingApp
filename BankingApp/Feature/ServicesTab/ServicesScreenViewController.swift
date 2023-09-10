import UIKit

final class ServicesScreenViewController: UIViewController {

    private let servicesScreenView = ServicesScreenView()
    let collectionManager: ManagesMenuCollection
    var applyForCardCoordinator: Coordinator?

    init(
        collectionManager: ManagesMenuCollection
    ) {
        self.collectionManager = collectionManager
        super.init(nibName: nil, bundle: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = servicesScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewManager(collectionManager)
        setMenuItems()
        servicesScreenView.collectionView.reloadData()
    }

    func setCloseButtonDelegate(_ delegate: CloseButtonDelegate) {
        servicesScreenView.delegate = delegate
    }

    func setCollectionViewManager(_ manager: ManagesMenuCollection) {
        servicesScreenView.collectionView.dataSource = manager
        servicesScreenView.collectionView.delegate = manager
    }
}

// MARK: - CloseButtonDelegate
extension ServicesScreenViewController: CloseButtonDelegate {
    func buttonPressed(_ button: UIButton) {
        dismiss(animated: true)
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
                    applyForCardCoordinator?.start()
                }
            ),
            MenuItemViewModel(
                title: L10n.ServicesScreen.viewCards,
                image: viewCardsSymbol,
                action: { [weak self] in
                    guard let self else { return }
                    let viewController = AccountApplicationsAssembly.assemble()
                    navigationController?.pushViewController(viewController, animated: true)
                }
            )
        ]
        collectionManager.setViewModel(menuItems)
    }
}
