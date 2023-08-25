import UIKit

final class PaymentsScreenViewController: UIViewController {

    private let paymentsScreenView = PaymentsScreenView()

    var presenter: PaymentsScreenViewOutput?

    override func loadView() {
        view = paymentsScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - PaymentsScreenViewInput
extension PaymentsScreenViewController: PaymentsScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension PaymentsScreenViewController {
}
