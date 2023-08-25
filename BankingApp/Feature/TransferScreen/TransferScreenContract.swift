// sourcery: AutoMockable
protocol TransferScreenViewInput: AnyObject {
    func configureViews()
}

protocol TransferScreenViewOutput {
    func viewDidLoad(_ view: TransferScreenViewInput)
}

// sourcery: AutoMockable
protocol TransferScreenInteractorInput {
}

// sourcery: AutoMockable
protocol TransferScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol TransferScreenRouterInput {
}

protocol TransferScreenRouterOutput: AnyObject {
}

protocol TransferScreenModuleInput: AnyObject {
	func configureModule(output: TransferScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol TransferScreenModuleOutput: AnyObject {
}
