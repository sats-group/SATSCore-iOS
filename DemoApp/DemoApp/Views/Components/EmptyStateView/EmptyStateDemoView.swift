import SwiftUI

struct EmptyStateDemoView: View {
    var viewData: EmptyStateViewData = .emptyVouchers

    func createEmptyStateView() -> UIView {
        let emptyView = EmptyStateView()
        emptyView.configure(with: viewData)
        return emptyView
    }

    var body: some View {
        DemoWrapperView(view: createEmptyStateView())
            .navigationTitle("EmptyStateView")
    }
}

struct SATSEmptyDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                EmptyStateDemoView()
            }

            NavigationView {
                EmptyStateDemoView(viewData: .emptyVouchers)
                    .preferredColorScheme(.dark)
            }

            EmptyStateDemoView(viewData: .emptyChallenges)

            EmptyStateDemoView(viewData: .emptyChallenges)
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .preferredColorScheme(.dark)
        }
    }
}

// MARK: Test data

extension EmptyStateViewData {
    static let emptyVouchers = EmptyStateViewData(
        icon: UIImage(named: "empty-vouchers-icon"),
        title: nil,
        description: "You currently don’t have any vouchers"
    )

    static let emptyChallenges = EmptyStateViewData(
        icon: UIImage(named: "empty-vouchers-icon"),
        title: "No ongoing or upcoming challenges",
        description: "There are no ongoing or upcoming challenges right now, " +
            "but check back later"
    )
}
