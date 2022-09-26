import SwiftUI
import SATSCore

struct SATSButtonSwftUIDemoView: View {
    @State var size: SATSButton.Size = .basic
    @State var isEnabled: Bool = true
    @State var isLoading: Bool = false

    var settingDescription: String {
        let sizeName: String
        switch size {
        case .compact: sizeName = "Compact"
        case .basic: sizeName = "Basic"
        case .large: sizeName = "Large"
        default:
            sizeName = "???"
        }

        return "\(isEnabled ? "Enabled" : "Disabled") - \(sizeName)"
    }

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(settingDescription)
                        .satsFont(.h3)
                    Spacer()
                }
                .padding(.horizontal)

                ScrollView(.vertical) {
                    VStack {
                        Button("Primary", action: {})
                            .satsButton(.primary, size: size, isLoading: isLoading)
                            .padding()

                        Button("Secondary", action: {})
                            .satsButton(.secondary, size: size, isLoading: isLoading)
                            .padding()

                        VStack(spacing: 20) {
                            HStack {
                                Spacer()

                                Button("Clean", action: {})
                                    .satsButton(.clean, size: size, isLoading: isLoading)

                                Spacer()
                            }

                            HStack {
                                Spacer()

                                Button("Clean Secondary", action: {})
                                    .satsButton(.cleanSecondary, size: size, isLoading: isLoading)

                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color.satsPrimary)

                        Button("CTA", action: {})
                            .satsButton(.cta, size: size, isLoading: isLoading)
                            .padding()

                        Button("Plain", action: {})
                            .satsButton(.plain, size: size, isLoading: isLoading)
                            .padding()

                        Button(action: {}) {
                            Label("Plain with Image", systemImage: "person.circle")
                        }
                        .satsButton(.plain, size: size, isLoading: isLoading)
                        .padding()
                    }
                    .disabled(!isEnabled)
                }

                Spacer()
            }
            .background(Color.backgroundPrimary.ignoresSafeArea())

            VStack {
                Spacer()

                VStack {
                    Toggle("Enabled", isOn: $isEnabled)

                    Toggle("Loading", isOn: $isLoading)

                    Picker("Size", selection: $size) {
                        Text("compact").tag(SATSButton.Size.compact)
                        Text("basic").tag(SATSButton.Size.basic)
                        Text("large").tag(SATSButton.Size.large)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                .background(Color.backgroundSurfacePrimary)
            }
        }
        .navigationTitle("SwiftUI Button Styles")
    }
}

struct SATSButtonSwftUIDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SATSFont.registerCustomFonts()
        return Group {
            NavigationView {
                SATSButtonSwftUIDemoView()
            }

            NavigationView {
                SATSButtonSwftUIDemoView()
            }.colorScheme(.dark)
        }
    }
}
