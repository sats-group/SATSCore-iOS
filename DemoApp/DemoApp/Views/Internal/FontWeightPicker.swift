import SwiftUI

struct FontWeightPicker: View {
    @Binding var weight: SATSFont.Weight

    var body: some View {
        Picker("Weight", selection: $weight) {
            Text(SATSFont.Weight.default.name).tag(SATSFont.Weight.default)
            Text(SATSFont.Weight.medium.name).tag(SATSFont.Weight.medium)
            Text(SATSFont.Weight.emphasis.name).tag(SATSFont.Weight.emphasis)
            Text(SATSFont.Weight.satsFeeling.name).tag(SATSFont.Weight.satsFeeling)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
