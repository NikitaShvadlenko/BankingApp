import UIKit

final class ServicesScreenViewController: UIViewController {

    private let servicesScreenView = ServicesScreenView()

    var presenter: ServicesScreenViewOutput?

    override func loadView() {
        view = servicesScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - ServicesScreenViewInput
extension ServicesScreenViewController: ServicesScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension ServicesScreenViewController {
}
