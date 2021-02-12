import SwiftUI

struct FontVariantPicker: View {
    @Binding var fontVariant: FontVariation

    var body: some View {
        Picker("Variant", selection: $fontVariant) {
            Text(FontVariation.default.name).tag(FontVariation.default)
            Text(FontVariation.medium.name).tag(FontVariation.medium)
            Text(FontVariation.emphasis.name).tag(FontVariation.emphasis)
            Text(FontVariation.satsFeeling.name).tag(FontVariation.satsFeeling)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
