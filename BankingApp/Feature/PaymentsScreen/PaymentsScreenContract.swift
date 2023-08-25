// sourcery: AutoMockable
protocol PaymentsScreenViewInput: AnyObject {
    func configureViews()
}

protocol PaymentsScreenViewOutput {
    func viewDidLoad(_ view: PaymentsScreenViewInput)
}

// sourcery: AutoMockable
protocol PaymentsScreenInteractorInput {
}

// sourcery: AutoMockable
protocol PaymentsScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol PaymentsScreenRouterInput {
}

protocol PaymentsScreenRouterOutput: AnyObject {
}

protocol PaymentsScreenModuleInput: AnyObject {
	func configureModule(output: PaymentsScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol PaymentsScreenModuleOutput: AnyObject {
}
