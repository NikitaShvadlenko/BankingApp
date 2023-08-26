import Foundation

final class AccountsScreenPresenter {
    weak var view: AccountsScreenViewInput?
    weak var moduleOutput: AccountsScreenModuleOutput?
    var interactor: AccountsScreenInteractorInput?
    var router: AccountsScreenRouterInput?
}

// MARK: - AccountsScreenViewOutput
extension AccountsScreenPresenter: AccountsScreenViewOutput {
    func viewDidRequestAccountDisplayStyle(_ view: AccountsScreenViewInput) {
        interactor?.retrieveAccountDisplayStyle()
    }

    func viewDidTapDisplayStyleButton(_ view: AccountsScreenViewInput) {
        interactor?.setNextDisplayStyle()
    }

    func viewDidTapLogoutButton(_ view: AccountsScreenViewInput) {
        print("Asking interactor to logout")
    }

    func viewDidLoad(_ view: AccountsScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - AccountsScreenInteractorOutput
extension AccountsScreenPresenter: AccountsScreenInteractorOutput {
    func interactorDidRetrieveAccountDisplayStyle(
        _ interactor: AccountsScreenInteractorInput,
        result: Result<AccountDisplayStyle, UserSettingManagerError>
    ) {
        switch result {
        case .success(let style):
            view?.setAccountDisplayStyle(style)
        case .failure(let error):
            switch error {
            case .failedToRetrieveItem:
                view?.setAccountDisplayStyle(AccountDisplayStyle.list)
            case .noAccountStyles:
                fatalError("No account styles")
            }
        }
    }
}

// MARK: - AccountsScreenRouterOutput
extension AccountsScreenPresenter: AccountsScreenRouterOutput {
}

// MARK: - AccountsScreenModuleInput
extension AccountsScreenPresenter: AccountsScreenModuleInput {
    func configureModule(output: AccountsScreenModuleOutput?) {
        self.moduleOutput = output
    }
}
