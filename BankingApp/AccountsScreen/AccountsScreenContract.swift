// sourcery: AutoMockable
protocol AccountsScreenViewInput: AnyObject {
    func configureViews()
}

protocol AccountsScreenViewOutput {
    func viewDidLoad(_ view: AccountsScreenViewInput)
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
