import UIKit

final class LinkTextView: UITextView {

    let mainPart: String
    let linkPart: String
    let link: String

    init(mainPart: String, linkPart: String, link: String) {
        self.mainPart = mainPart
        self.linkPart = linkPart
        self.link = link

        super.init(frame: .zero, textContainer: nil)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension LinkTextView {
    public func configureView(font: UIFont, textColor: UIColor) {
        linkTextAttributes = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: textColor,
            .font: font
        ]
    }
}

// MARK: - Private Methods
extension LinkTextView {
    private func setupView() {
        isEditable = false
        isScrollEnabled = false
        isUserInteractionEnabled = true

        let text = mainPart + linkPart
        let attributedString = NSMutableAttributedString(string: text)
        let linkRange = (text as NSString).range(of: linkPart)
        attributedString.addAttribute(.link, value: link, range: linkRange)

        attributedText = attributedString
        delegate = self
    }
}
// MARK: - UITextViewDelegate
extension LinkTextView: UITextViewDelegate {
    func textView(
        _ textView: UITextView,
        shouldInteractWith URL: URL,
        in characterRange: NSRange,
        interaction: UITextItemInteraction
    ) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
