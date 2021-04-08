import SwiftUI

struct GradientDemoView: View {
    func gradientView() -> UIView {
        let gradient = GradientView()
        gradient.colors = [
            .backgroundTopStart,
            .backgroundTopEnd,
        ]
        return gradient
    }

    var body: some View {
        VStack {
            Spacer()
            DemoWrapperView(view: gradientView())
                .frame(height: 250)
            Spacer()
        }
        .navigationTitle("GradientView")
    }
}

struct GradientDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GradientDemoView()
        }
    }
}
