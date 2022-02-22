// taken from https://davedelong.com/blog/2021/10/09/simplifying-backwards-compatibility-in-swift/

import SwiftUI

public struct Backport<Content> {
    public let content: Content

    public init(_ content: Content) {
        self.content = content
    }
}
