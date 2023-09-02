import UIKit

final class PaymentsScreenView: UIView {
    let label = ShareLabel(style: .imageFirst)
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
extension PaymentsScreenView {
    private func configureViews() {
        backgroundColor = .white
        label.configure(title: "Title")
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}
