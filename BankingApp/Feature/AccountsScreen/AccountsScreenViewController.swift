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
    func configureViews() {
    }
}

// MARK: - Private methods
extension AccountsScreenViewController {
}
