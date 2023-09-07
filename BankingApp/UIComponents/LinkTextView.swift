
import UIKit

final class LinkTextView: UITextView {

    let mainPart: String
    let linkPart: String
    let link: String
    let trailingPart: String

    private var mainPartAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 16),
        .foregroundColor: UIColor.black
    ]

    private var linkPartAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 16),
        .foregroundColor: UIColor.blue,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]

    init(mainPart: String, linkPart: String, link: String, trailingPart: String) {
        self.mainPart = mainPart
        self.linkPart = linkPart
        self.link = link
        self.trailingPart = trailingPart
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
        mainPartAttributes[.font] = font
        mainPartAttributes[.foregroundColor] = textColor
        linkPartAttributes[.font] = font
        setupView()
    }
}

// MARK: - Private Methods
extension LinkTextView {
    private func setupView() {
        isEditable = false
        isScrollEnabled = false
        isUserInteractionEnabled = true

        let mainAttributedString = NSMutableAttributedString(string: mainPart, attributes: mainPartAttributes)

        let linkAttributedString = NSMutableAttributedString(
            string: linkPart, attributes: linkPartAttributes
        )

        let trailingAttributedString = NSMutableAttributedString(
            string: trailingPart, attributes: mainPartAttributes
        )

        linkPartAttributes[.link] = link

        mainAttributedString.append(linkAttributedString)
        mainAttributedString.append(trailingAttributedString)

        attributedText = mainAttributedString
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
