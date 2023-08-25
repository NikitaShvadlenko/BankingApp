// sourcery: AutoMockable
protocol ServicesScreenViewInput: AnyObject {
    func configureViews()
}

protocol ServicesScreenViewOutput {
    func viewDidLoad(_ view: ServicesScreenViewInput)
}

// sourcery: AutoMockable
protocol ServicesScreenInteractorInput {
}

// sourcery: AutoMockable
protocol ServicesScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol ServicesScreenRouterInput {
}

protocol ServicesScreenRouterOutput: AnyObject {
}

protocol ServicesScreenModuleInput: AnyObject {
	func configureModule(output: ServicesScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol ServicesScreenModuleOutput: AnyObject {
}
