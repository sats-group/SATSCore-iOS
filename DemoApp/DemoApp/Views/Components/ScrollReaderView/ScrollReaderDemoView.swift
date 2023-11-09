import SwiftUI

struct ScrollViewOffsetReaderDemoView: View {
    @State var scrollValue: CGFloat = 0

    var body: some View {
        ScrollViewOffsetReader(scrollValue: $scrollValue) {
            Rectangle()
                .foregroundColor(.skeleton)
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
        .navigationTitle("ScrollViewOffsetReaderDemoView")
    }
}

struct ScrollViewOffsetReaderDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrollViewOffsetReaderDemoView()
        }
    }
}
