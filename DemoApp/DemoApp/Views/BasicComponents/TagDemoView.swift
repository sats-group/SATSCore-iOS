import SwiftUI

struct TagDemoView: View {
    var body: some View {
        VStack(spacing: .spacingM) {
            Tag("Primary", style: .primary)
            Tag("Secondary", style: .secondary)
            Tag("Coral", style: .coral)
        }
        .navigationTitle("Tag")
    }
}
