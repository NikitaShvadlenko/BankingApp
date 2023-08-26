// sourcery: AutoMockable
protocol AccountsScreenViewInput: AnyObject {
    func configureViews()
    func setAccountDisplayStyle(_ selectedStyle: AccountDisplayStyle)
}

protocol AccountsScreenViewOutput {
    func viewDidLoad(_ view: AccountsScreenViewInput)
    func viewDidTapDisplayStyleButton(_ view: AccountsScreenViewInput)
    func viewDidTapLogoutButton(_ view: AccountsScreenViewInput)
    func viewDidRequestAccountDisplayStyle(_ view: AccountsScreenViewInput)
}

// sourcery: AutoMockable
protocol AccountsScreenInteractorInput {
}

// sourcery: AutoMockable
protocol AccountsScreenInteractorOutput: AnyObject {
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
