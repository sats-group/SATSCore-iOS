import SwiftUI

struct ScrollReaderDemoView: View {
    @State var scrollValue: CGFloat = 0

    var body: some View {
        ScrollViewOffsetReader(scrollValue: $scrollValue) {
            Rectangle()
                .foregroundColor(.shimmer)
                .overlay(
                    VStack {
                        Text("Top").bold()
                        Spacer()
                        Text("Very long content").bold()
                        Spacer()
                        Text("Bottom").bold()
                        Spacer().frame(height: 100)
                    }
                )
                .frame(height: 1200)
        }
        .overlay(
            VStack {
                Spacer()

                Text("\(scrollValue)")
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
            }
        )
        .navigationTitle("ScrollReaderDemoView")
    }
}

struct ScrollReaderDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrollReaderDemoView()
        }
    }
}
