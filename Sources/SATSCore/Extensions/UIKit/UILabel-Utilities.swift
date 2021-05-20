import UIKit

extension UILabel {
    func setText(text: String?, withLineHeightMultiple lineHeight: CGFloat) {
        guard let text = text else { return }
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = lineHeight
        let attributeString = NSMutableAttributedString(
            string: text,
            attributes: [.paragraphStyle: style]
        )
        self.attributedText = attributeString
    }
}
