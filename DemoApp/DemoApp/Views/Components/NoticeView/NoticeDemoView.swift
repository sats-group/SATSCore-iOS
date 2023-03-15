import SwiftUI

struct NoticeDemoView: View {
    @State var notice: Notice?

    @State var includeTitle: Bool = true
    @State var autoDismiss: Bool = false
    @State var edgeTop: Bool = true
    @State var withAction: Bool = true
    @State var style: Style = .success

    var edge: Notice.Edge { edgeTop ? .top : .bottom }

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 30) {
                Spacer()

                Button("Toggle Notice", action: toggleNotice)
                    .satsButton(.primary, size: .large)

                Spacer()
            }
            .padding()

            noticeEditor
        }
        .inlineNotice($notice, edge: edge)
        .background(Color.backgroundPrimary)
        .navigationTitle("Notice")
    }

    @ViewBuilder var noticeEditor: some View {
        VStack {
            Toggle("Include title?", isOn: $includeTitle)
            Toggle("Auto dismiss?", isOn: $autoDismiss)
            Toggle("Top Edge?", isOn: $edgeTop)
            if style == .error {
                Toggle("With Action?", isOn: $withAction)
            }

            HStack {
                Text("Style")

                Spacer()

                Picker("\(style.rawValue)", selection: $style) {
                    Text("Info").tag(Style.info)
                    Text("Success").tag(Style.success)
                    Text("Warning").tag(Style.warning)
                    Text("Error").tag(Style.error)
                }
                .pickerStyle(MenuPickerStyle())
                .padding(4)
            }
        }
        .padding()
        .accentColor(Color.primary)
        .background(Color.backgroundSurfacePrimary)
    }

    func toggleNotice() {
        if notice != nil {
            // when manually dismissing the notice
            // it's better to wrap that code with an
            // `withAnimation` block
            withAnimation {
                notice = nil
            }
        } else {
            notice = createNotice()
        }
    }

    // This is the normal way to create `Notice` values
    // by using the `.success`, `.warning` and `.error`
    // factory methods which contain sensible defaults
    private func createNotice() -> Notice {
        let title = includeTitle ? "Title text" : nil

        switch (style, withAction) {
        case (.info, _):
            return Notice.info(
                title: title,
                message: "Sample info notice",
                autoDismiss: autoDismiss
            )

        case (.success, _):
            return Notice.success(
                title: title,
                message: "Sample success notice",
                autoDismiss: autoDismiss
            )

        case (.warning, _):
            return Notice.warning(
                title: title,
                message: "Sample warning notice",
                autoDismiss: autoDismiss
            )

        case (.error, true):
            return Notice.error(
                title: title,
                message: "Sample error notice",
                actionTitle: "Action",
                action: { print("on action!") }
            )

        case (.error, false):
            return Notice.error(
                title: title,
                message: "Sample warning notice",
                autoDismiss: autoDismiss
            )
        }
    }

    // This `style` enum is only for the demo
    // In general I favor struct values over enums as they are
    // extensible outside the library
    enum Style: String, Hashable {
        case info = "Info"
        case success = "Success"
        case warning = "Warning"
        case error = "Error"
    }
}

struct ErrorNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NoticeDemoView()
                .background(Color.red)
                .previewDisplayName("Full Demo")

            VStack(spacing: .spacingL) {
                Spacer()

                NoticeView(notice: .sampleInfo)

                NoticeView(notice: .sampleSuccess)

                NoticeView(notice: .sampleWarning)

                NoticeView(notice: .sampleError)

                NoticeView(notice: .sampleErrorWithAction)

                Spacer()
            }
            .padding()
            .background(Color.backgroundPrimary)
            .previewDisplayName("Notice Showcase")
            .previewLayout(.sizeThatFits)
        }
    }
}

extension Notice {
    static let sampleError = Notice.error(
        message: "This is a sample error"
    )

    static let sampleErrorWithAction = Notice.error(
        message: "This is a sample error",
        actionTitle: "Action",
        action: { print("Sample") }
    )

    static let sampleSuccess = Notice.success(
        title: "Your operation was succesful",
        message: "everything is awesome!"
    )

    static let sampleWarning = Notice.warning(
        message: "You should be careful about this!"
    )

    static let sampleInfo = Notice.info(
        message: "We have a new notice style"
    )
}
