import SwiftUI

public struct RadioGroup<Option: Identifiable, Label: View>: View {
    @Binding private var selected: Option
    private let options: [Option]
    private let label: (Option) -> Label

    public init(
        selected: Binding<Option>,
        options: [Option],
        label: @escaping (Option) -> Label
    ) {
        _selected = selected
        self.options = options
        self.label = label
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(options) { option in
                radioButtonRow(for: option)

                if shouldAddDivider(for: option) {
                    Divider()
                }
            }
        }
    }

    private func radioButtonRow(for option: Option) -> some View {
        HStack(spacing: .spacingM) {
            RadioButton(isSelected: option.id == selected.id)
            label(option)
        }
        .padding(EdgeInsets(vertical: .spacingM, horizontal: 0))
        .onTapGesture { selected = option }
    }

    private func shouldAddDivider(for option: Option) -> Bool {
        option.id != options.last?.id
    }
}

extension RadioGroup {
    struct RadioButton: View {
        let isSelected: Bool

        private var fill: Color { isSelected ? .selectorSelected : .selectorUnselected }
        private var lineWidth: CGFloat = 2

        init(isSelected: Bool) {
            self.isSelected = isSelected
        }

        var body: some View {
            Circle()
                .strokeBorder(fill, lineWidth: lineWidth)
                .frame(size: 24)
                .if(isSelected, transform: { circle in
                    circle
                        .overlay(
                            Circle()
                                .fill(fill)
                                .padding(lineWidth * 2)
                        )
                })
        }
    }
}

struct RadioGroup_Previews: PreviewProvider {
    enum PreviewOption: String, Identifiable, Hashable, CaseIterable {
        case gxClass = "GX class"
        case ptSession = "PT session"
        case studioTraining = "Studio Training"

        var id: Int { hashValue }
    }

    struct Demo: View {
        @State private var selected: PreviewOption = .gxClass

        var body: some View {
            RadioGroup(
                selected: $selected,
                options: PreviewOption.allCases,
                label: { Text($0.rawValue) }
            )
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }

    static var previews: some View {
        Demo()
    }
}
