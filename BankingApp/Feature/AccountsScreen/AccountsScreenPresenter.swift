import Foundation

final class AccountsScreenPresenter {
    weak var view: AccountsScreenViewInput?
    weak var moduleOutput: AccountsScreenModuleOutput?
    var interactor: AccountsScreenInteractorInput?
    var router: AccountsScreenRouterInput?

    let accountDisplayStyles = AccountDisplayStyle.allCases
    var selectedDisplayStyleIndex = 0
}

// MARK: - AccountsScreenViewOutput
extension AccountsScreenPresenter: AccountsScreenViewOutput {
    func viewDidRequestAccountDisplayStyle(_ view: AccountsScreenViewInput) {
        guard !accountDisplayStyles.isEmpty else {
            return
        }
        let selectedStyle = accountDisplayStyles[selectedDisplayStyleIndex]
        view.setAccountDisplayStyle(selectedStyle)
    }

    func viewDidTapDisplayStyleButton(_ view: AccountsScreenViewInput) {
        print("Asking TableViewManager to change the tableViewCellStyle")
        guard !accountDisplayStyles.isEmpty else {
            return
        }
        selectedDisplayStyleIndex += 1
        if selectedDisplayStyleIndex >= accountDisplayStyles.count {
            selectedDisplayStyleIndex = 0
        }
        let selectedStyle = accountDisplayStyles[selectedDisplayStyleIndex]
        view.setAccountDisplayStyle(selectedStyle)
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
