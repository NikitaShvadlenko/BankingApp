// sourcery: AutoMockable
protocol AccountsScreenViewInput: AnyObject {
    func configureViews()
    func setAccountDisplayStyle(_ selectedStyle: AccountDisplayStyle)
    func displayFailedToFetchUsersAlert()
}

protocol AccountsScreenViewOutput {
    func viewDidLoad(_ view: AccountsScreenViewInput)
    func viewDidTapDisplayStyleButton(_ view: AccountsScreenViewInput)
    func viewDidTapLogoutButton(_ view: AccountsScreenViewInput)
    func viewDidRequestAccountDisplayStyle(_ view: AccountsScreenViewInput)
    func viewDidRequestAccountsInformation(_ view: AccountsScreenViewInput)
}

// sourcery: AutoMockable
protocol AccountsScreenInteractorInput {
    func retrieveAccountDisplayStyle()
    func setNextDisplayStyle()
    func fetchAccounts(for accountName: String)
}

// sourcery: AutoMockable
protocol AccountsScreenInteractorOutput: AnyObject {
    func interactorDidRetrieveAccountDisplayStyle(
        _ interactor:AccountsScreenInteractorInput,
        result: Result<AccountDisplayStyle, UserSettingManagerError>
    )

    func interactorDidRetrieveAccountDetails(
        _ interactor:AccountsScreenInteractorInput,
        result: Result<[Account], Error>
    )
}

// sourcery: AutoMockable
protocol AccountsScreenRouterInput {
}

protocol AccountsScreenRouterOutput: AnyObject {
}

protocol AccountsScreenModuleInput: AnyObject {
	func configureModule(output: AccountsScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol AccountsScreenModuleOutput: AnyObject {
}
