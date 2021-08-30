import SwiftUI

private extension Color {
    static let pickerEnabled = Color.onBackgroundPrimary
    static let pickerDisabled = Color.onBackgroundDisabled
    static let pickerDisabledLine = Color.border
}

/// A segmented control-like for SwiftUI
public struct TabSelectionView: View {
    @Binding var selectedValue: Int
    let options: [String]

    /// Creates a tab selection component
    /// - Parameters:
    ///   - selectedValue: This value should be between 0 and `options.count - 1`,
    ///                    because it's the index of the selected `option`
    ///   - options: A non-empty array of titles ot be used for the tab options
    public init(selectedValue: Binding<Int>, options: [String]) {
        assert(!options.isEmpty, "We should get at least one option to select")

        self._selectedValue = selectedValue
        self.options = options
    }

    private var numberOfItems: Int { options.count }

    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(Array(options.enumerated()), id: \.0) { index, option in
                    TabButton(
                        title: option,
                        action: selectValue(index),
                        active: selectedValue == index
                    )
                }
            }

            ZStack(alignment: .bottomLeading) {
                Color.pickerDisabledLine
                    .frame(height: 1)

                GeometryReader { proxy in
                    Color.pickerEnabled
                        .frame(width: proxy.size.width / CGFloat(numberOfItems))
                        .offset(x: proxy.size.width / CGFloat(numberOfItems) * CGFloat(selectedValue), y: 0)
                }
            }
            .frame(height: 2)
        }
    }

    private func selectValue(_ value: Int) -> () -> Void {
        return {
            withAnimation { selectedValue = value }
        }
    }
}

extension TabSelectionView {
    struct TabButton: View {
        let title: String
        let action: () -> Void
        let active: Bool

        var body: some View {
            Button(action: action, label: {
                HStack {
                    Spacer()
                    Text(title)
                        .foregroundColor(active ? .pickerEnabled : .pickerDisabled)
                        .scaledToFit()
                        .minimumScaleFactor(0.7)
                    Spacer()
                }
                .padding()
            })
            .satsFont(.basic, weight: .emphasis)
        }
    }
}

struct TabSelectionView_Previews: PreviewProvider {
    struct Demo: View {
        @State var value: Int = 2

        var body: some View {
            VStack {
                Spacer()
                TabSelectionView(
                    selectedValue: $value,
                    options: ["Group class", "PT Session", "Treatments"]
                )
                    .background(Color.white)
                Spacer()
            }
            .background(Color.backgroundPrimary)
        }
    }

    static var previews: some View {
        Group {
            Demo()

            Demo()
                .previewDevice("iPhone 8")
        }
    }
}
