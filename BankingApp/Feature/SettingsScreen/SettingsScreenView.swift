import UIKit

final class SettingsScreenView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension SettingsScreenView {
    private func configureViews() {
        backgroundColor = .white
    }
}
