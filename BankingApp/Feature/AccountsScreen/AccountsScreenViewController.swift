import UIKit

final class AccountsScreenViewController: UIViewController {

    private let accountsScreenView = AccountsScreenView()

    var presenter: AccountsScreenViewOutput?

    override func loadView() {
        view = accountsScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - AccountsScreenViewInput
extension AccountsScreenViewController: AccountsScreenViewInput {
    func setAccountDisplayStyle(_ selectedStyle: AccountDisplayStyle) {
        print("Reload tableView with animation (or let manager handle this)")
        setAccountDisplayIcon(newStyle: selectedStyle)
    }

    func configureViews() {
        configureNavigationBar()
        presenter?.viewDidRequestAccountDisplayStyle(self)
    }
}

// MARK: - Private methods
extension AccountsScreenViewController {
    private func configureNavigationBar() {
        setNavigationBarTitle()
        setLeftNavigationItem()
        setRightNavigationItem()
    }

    private func setNavigationBarTitle() {
        title = L10n.AccountsScreen.title
        let navigaitonBarAppearence = UINavigationBarAppearance()
        navigaitonBarAppearence.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Asset.Colors.viewTitle.color,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)
        ]
        navigationController?.navigationBar.standardAppearance = navigaitonBarAppearence
    }

    private func setLeftNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(sfSymbol: SFSymbol.rectangleOnRectangle),
            style: .plain,
            target: self,
            action: #selector (didTapAccountsBarButton)
        )
    }

    private func setRightNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: L10n.NavigationBar.loguot,
            style: .plain,
            target: self,
            action: #selector (didTapLogoutBarButton)
        )
    }

    private func setAccountDisplayIcon(newStyle: AccountDisplayStyle) {
        switch newStyle {
        case .textFirst:
            navigationItem.leftBarButtonItem?.image = UIImage(sfSymbol: SFSymbol.list)
        case .imageFirst:
            navigationItem.leftBarButtonItem?.image = UIImage(sfSymbol: SFSymbol.rectangleOnRectangle)
        }
    }

    @objc
    private func didTapAccountsBarButton() {
        presenter?.viewDidTapDisplayStyleButton(self)
    }

    @objc
    private func didTapLogoutBarButton() {

    }
}
