import UIKit

extension NSMutableParagraphStyle {
    func with(lineHeightMultiple value: CGFloat) -> NSMutableParagraphStyle {
        lineHeightMultiple = value
        return self
    }

    func with(lineHeight value: CGFloat) -> NSMutableParagraphStyle {
        minimumLineHeight = value
        return self
    }

    func with(alignment value: NSTextAlignment) -> NSMutableParagraphStyle {
        alignment = value
        return self
    }

    func with(lineSpacing value: CGFloat) -> NSMutableParagraphStyle {
        lineSpacing = value
        return self
    }
}
