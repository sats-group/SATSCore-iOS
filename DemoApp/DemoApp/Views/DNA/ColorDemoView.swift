import SwiftUI

struct ColorSection: Identifiable {
    var id: String { name }

    let name: String
    let colors: [ColorDemo]
}

struct ColorDemo: Identifiable {
    var id: String { name }

    let name: String
    let color: Color
}

struct ColorDemoView: View {
    let sections: [ColorSection] = [
        ColorSection(
            name: "Background",
            colors: [
                ColorDemo(name: "backgroundPrimary", color: .backgroundPrimary),
                ColorDemo(name: "backgroundSecondary", color: .backgroundSecondary),
                ColorDemo(name: "backgroundShimmer", color: .backgroundShimmer),
                ColorDemo(name: "backgroundTabbar", color: .backgroundTabbar),
                ColorDemo(name: "backgroundSurfaceStart", color: .backgroundSurfaceStart),
                ColorDemo(name: "backgroundSurfaceEnd", color: .backgroundSurfaceEnd),
            ]
        ),

        ColorSection(
            name: "Buttons",
            colors: [
                ColorDemo(name: "buttonPrimary", color: .buttonPrimary),
                ColorDemo(name: "buttonPrimaryHighlight", color: .buttonPrimaryHighlight),
                ColorDemo(name: "buttonPrimaryDisabled", color: .buttonPrimaryDisabled),
                ColorDemo(name: "buttonSecondary", color: .buttonSecondary),
                ColorDemo(name: "buttonSecondaryHighlight", color: .buttonSecondaryHighlight),
                ColorDemo(name: "buttonSecondaryDisabled", color: .buttonSecondaryDisabled),
                ColorDemo(name: "buttonCta", color: .buttonCta),
                ColorDemo(name: "buttonCtaHighlight", color: .buttonCtaHighlight),
                ColorDemo(name: "buttonCtaDisabled", color: .buttonCtaDisabled),
            ]
        ),
        ColorSection(
            name: "\"On\"",
            colors: [
                ColorDemo(name: "onButtonPrimary", color: .onButtonPrimary),
                ColorDemo(name: "onButtonPrimarySecondary", color: .onButtonPrimarySecondary),
                ColorDemo(name: "onButtonSecondary", color: .onButtonSecondary),
                ColorDemo(name: "onButtonSecondarySecondary", color: .onButtonSecondarySecondary),
                ColorDemo(name: "onButtonCta", color: .onButtonCta),
                ColorDemo(name: "onButtonCtaSecondary", color: .onButtonCtaSecondary),
                ColorDemo(name: "onBackgroundSurface", color: .onBackgroundSurface),
                ColorDemo(name: "onBackgroundSurfaceSecondary", color: .onBackgroundSurfaceSecondary),
                ColorDemo(name: "onBackgroundPrimary", color: .onBackgroundPrimary),
                ColorDemo(name: "onBackgroundPrimarySecondary", color: .onBackgroundPrimarySecondary),
            ]
        ),
        ColorSection(
            name: "Signal",
            colors: [
                ColorDemo(name: "signalSuccess", color: .signalSuccess),
                ColorDemo(name: "signalWarning", color: .signalWarning),
                ColorDemo(name: "signalDelete", color: .signalDelete),
                ColorDemo(name: "signalError", color: .signalError),
            ]
        ),
        ColorSection(
            name: "Others",
            colors: [
                ColorDemo(name: "waitlist", color: .waitlist),
                ColorDemo(name: "waitlistHighlight", color: .waitlistHighlight),
                ColorDemo(name: "link", color: .link),
                ColorDemo(name: "linkHighlight", color: .linkHighlight),
                ColorDemo(name: "border", color: .border),
            ]
        ),
        ColorSection(
            name: "🔵 Blue Theme",
            colors: [
                ColorDemo(name: "blueButtonPrimary", color: Color(ColorTheme.blue.buttonPrimary)),
                ColorDemo(name: "blueButtonPrimaryHighlight", color: Color(ColorTheme.blue.buttonPrimaryHighlight)),
                ColorDemo(name: "blueButtonPrimaryDisabled", color: Color(ColorTheme.blue.buttonPrimaryDisabled)),

                ColorDemo(name: "blueSelection", color: Color(ColorTheme.blue.selection)),

                ColorDemo(name: "blueGradientStart", color: Color(ColorTheme.blue.backgroundTopStart)),
                ColorDemo(name: "blueGradientEnd", color: Color(ColorTheme.blue.backgroundTopEnd)),
            ]
        ),
        ColorSection(
            name: "🥈 Silver Theme",
            colors: [
                ColorDemo(name: "silverButtonPrimary", color: Color(ColorTheme.silver.buttonPrimary)),
                ColorDemo(name: "silverButtonPrimaryHighlight", color: Color(ColorTheme.silver.buttonPrimaryHighlight)),
                ColorDemo(name: "silverButtonPrimaryDisabled", color: Color(ColorTheme.silver.buttonPrimaryDisabled)),

                ColorDemo(name: "silverSelection", color: Color(ColorTheme.silver.selection)),

                ColorDemo(name: "silverGradientStart", color: Color(ColorTheme.silver.backgroundTopStart)),
                ColorDemo(name: "silverGradientEnd", color: Color(ColorTheme.silver.backgroundTopEnd)),
            ]
        ),
        ColorSection(
            name: "🥇 Gold Theme",
            colors: [
                ColorDemo(name: "goldButtonPrimary", color: Color(ColorTheme.gold.buttonPrimary)),
                ColorDemo(name: "goldButtonPrimaryHighlight", color: Color(ColorTheme.gold.buttonPrimaryHighlight)),
                ColorDemo(name: "goldButtonPrimaryDisabled", color: Color(ColorTheme.gold.buttonPrimaryDisabled)),

                ColorDemo(name: "goldSelection", color: Color(ColorTheme.gold.selection)),

                ColorDemo(name: "goldGradientStart", color: Color(ColorTheme.gold.backgroundTopStart)),
                ColorDemo(name: "goldGradientEnd", color: Color(ColorTheme.gold.backgroundTopEnd)),
            ]
        ),
        ColorSection(
            name: "🏆 Platinum Theme",
            colors: [
                ColorDemo(name: "platinumButtonPrimary", color: Color(ColorTheme.platinum.buttonPrimary)),
                ColorDemo(
                    name: "platinumButtonPrimaryHighlight",
                    color: Color(ColorTheme.platinum.buttonPrimaryHighlight)
                ),
                ColorDemo(
                    name: "platinumButtonPrimaryDisabled",
                    color: Color(ColorTheme.platinum.buttonPrimaryDisabled)
                ),

                ColorDemo(name: "platinumSelection", color: Color(ColorTheme.platinum.selection)),
                ColorDemo(name: "platinumGradientStart", color: Color(ColorTheme.platinum.backgroundTopStart)),
                ColorDemo(name: "platinumGradientEnd", color: Color(ColorTheme.platinum.backgroundTopEnd)),
            ]
        ),
    ]

    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: header(name: section.name)) {
                    ForEach(section.colors, content: ColorPillView.init(demo:))
                }
            }
        }
        .navigationTitle("Colors")
    }

    func header(name: String) -> some View {
        VStack {
            Text(name)

            HStack {
                Spacer()

                Text("Light ✌️")

                Spacer()

                Text("Dark 🤘")

                Spacer()
            }
        }
    }
}

struct ColorPillView: View {
    let demo: ColorDemo

    var body: some View {
        HStack(spacing: 0) {
            demo.color
                .colorScheme(.light)

            demo.color
                .colorScheme(.dark)
        }
        .overlay(label())
        .frame(height: 80)
        .cornerRadius(8)
    }

    func label() -> some View {
        Text("\(demo.name)")
            .foregroundColor(.white)
            .font(.caption)
            .multilineTextAlignment(.center)
            .padding(4)
            .background(Color.black.opacity(0.7))
            .cornerRadius(4)
    }
}

struct ColorDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ColorDemoView()
        }
        .colorScheme(.dark)
    }
}
