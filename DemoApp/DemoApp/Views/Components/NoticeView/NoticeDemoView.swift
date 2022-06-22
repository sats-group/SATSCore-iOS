//
//  ErrorNoticeView.swift
//  DemoApp
//
//  Created by Felipe Espinoza on 24/06/2021.
//

import SwiftUI

struct NoticeDemoView: View {
    @State var notice: Notice?

    @State var includeSubtitle: Bool = false
    @State var autoDismiss: Bool = true
    @State var edgeTop: Bool = true
    @State var withAction: Bool = false
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
            Toggle("Include Subtitle?", isOn: $includeSubtitle)
            Toggle("Auto dismiss?", isOn: $autoDismiss)
            Toggle("Top Edge?", isOn: $edgeTop)
            if style == .error {
                Toggle("With Action?", isOn: $withAction)
            }

            HStack {
                Text("Style")

                Spacer()

                Picker("\(style.rawValue)", selection: $style) {
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
        let subtitle = includeSubtitle ? "Subtitle text" : nil

        switch (style, withAction) {
        case (.success, _):
            return Notice.success(
                title: "Sample success notice",
                explanation: subtitle,
                autoDismiss: autoDismiss
            )

        case (.warning, _):
            return Notice.warning(
                title: "Sample warning notice",
                explanation: subtitle,
                autoDismiss: autoDismiss
            )

        case (.error, true):
            return Notice.error(
                title: "Sample error notice",
                explanation: subtitle,
                actionTitle: "Action",
                action: { print("on action!") }
            )

        case (.error, false):
            return Notice.error(
                title: "Sample error notice",
                explanation: subtitle,
                autoDismiss: autoDismiss
            )
        }
    }

    // This `style` enum is only for the demo
    // In general I favor struct values over enums as they are
    // extensible outside the library
    enum Style: String, Hashable {
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
                .previewDevice("iPhone 12 Pro")

            Group {
                NoticeView(notice: .sampleSuccess)

                NoticeView(notice: .sampleWarning)

                NoticeView(notice: .sampleError)

                NoticeView(notice: .sampleErrorWithAction)
            }
            .previewLayout(.sizeThatFits)
        }
    }
}

extension Notice {
    static let sampleError = Notice.error(
        title: "This is a sample error"
    )

    static let sampleErrorWithAction = Notice.error(
        title: "This is a sample error",
        actionTitle: "Action",
        action: { print("Sample") }
    )

    static let sampleSuccess = Notice.success(
        title: "Your operation was succesful",
        explanation: "everything is awesome!"
    )

    static let sampleWarning = Notice.warning(
        title: "You should be careful about this!"
    )
}
