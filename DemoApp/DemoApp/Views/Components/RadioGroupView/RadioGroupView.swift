import SATSCore
import SwiftUI

struct RadioGroupView: View {
    @State private var selectedOption: DemoOption = .yoga

    var body: some View {
        List {
            RadioGroup(
                selected: $selectedOption,
                options: DemoOption.allCases,
                label: { option in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(option.rawValue)

                        Text(option.description)
                            .foregroundColor(.onSurfaceSecondary)
                    }
                    .satsFont(.basic)
                }
            )
        }
        .navigationTitle("RadioButtonGroup")
    }
}

extension RadioGroupView {
    enum DemoOption: String, Identifiable, Hashable, CaseIterable {
        case yoga = "Yoga"
        case indoorRunning = "Indoor Running"
        case studioTraining = "Studio Training"

        var id: Int { hashValue }

        var description: String {
            switch self {
            case .yoga:
                return "Stretch and flexibility"

            case .indoorRunning:
                return "Cardio"

            case .studioTraining:
                return "Strenght"
            }
        }
    }
}

struct RadioButtonGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RadioGroupView()
        }
    }
}
