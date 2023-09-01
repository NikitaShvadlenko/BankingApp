// sourcery: AutoMockable
protocol TransactionDetailScreenViewInput: AnyObject {
    func configureViews(selectedPage: Int, pagesTotal: Int)
    func configurePagingView(selectedPage: Int)
}

protocol TransactionDetailScreenViewOutput {
    func viewDidLoad(_ view: TransactionDetailScreenViewInput)
}

// sourcery: AutoMockable
protocol TransactionDetailScreenInteractorInput {
}

// sourcery: AutoMockable
protocol TransactionDetailScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol TransactionDetailScreenRouterInput {
}

protocol TransactionDetailScreenRouterOutput: AnyObject {
}

protocol TransactionDetailScreenModuleInput: AnyObject {
	func configureModule(output: TransactionDetailScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol TransactionDetailScreenModuleOutput: AnyObject {
}
