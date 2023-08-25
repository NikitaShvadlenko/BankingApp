import Foundation

final class AccountsScreenPresenter {
    weak var view: AccountsScreenViewInput?
    weak var moduleOutput: AccountsScreenModuleOutput?
    var interactor: AccountsScreenInteractorInput?
    var router: AccountsScreenRouterInput?
}

// MARK: - AccountsScreenViewOutput
extension AccountsScreenPresenter: AccountsScreenViewOutput {
    func viewDidLoad(_ view: AccountsScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - AccountsScreenInteractorOutput
extension AccountsScreenPresenter: AccountsScreenInteractorOutput {
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

// MARK: - Private methods
extension AccountsScreenPresenter {
}
