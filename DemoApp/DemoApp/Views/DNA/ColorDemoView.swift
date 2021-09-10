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
            name: "Primary",
            colors: [
                ColorDemo(name: "primary", color: .satsPrimary),
                ColorDemo(name: "primaryHighlight", color: .satsPrimaryHighlight),
                ColorDemo(name: "primaryDisabled", color: .satsPrimaryDisabled),
            ]
        ),
        ColorSection(
            name: "Secondary",
            colors: [
                ColorDemo(name: "secondary", color: .satsSecondary),
                ColorDemo(name: "secondaryHighlight", color: .satsSecondaryHighlight),
                ColorDemo(name: "secondaryDisabled", color: .satsSecondaryDisabled),
                ColorDemo(name: "clean", color: .clean),
            ]
        ),
        ColorSection(
            name: "CTA",
            colors: [
                ColorDemo(name: "cta", color: .cta),
                ColorDemo(name: "ctaHighlight", color: .ctaHighlight),
                ColorDemo(name: "ctaDisabled", color: .ctaDisabled),
                ColorDemo(name: "nonText", color: .nonText),
            ]
        ),
        ColorSection(
            name: "Clean",
            colors: [
                ColorDemo(name: "clean", color: .clean),
                ColorDemo(name: "cleanHighlightgithub", color: .cleanHighlight),
                ColorDemo(name: "cleanDisabled", color: .cleanDisabled),
            ]
        ),
        ColorSection(
            name: "Clean Secondary",
            colors: [
                ColorDemo(name: "cleanSecondary", color: .cleanSecondary),
                ColorDemo(name: "cleanSecondaryHighlight", color: .cleanSecondaryHighlight),
                ColorDemo(name: "cleanSecondaryDisabled", color: .cleanSecondaryDisabled),
            ]
        ),
        ColorSection(
            name: "Background",
            colors: [
                ColorDemo(name: "backgroundPrimary", color: .backgroundPrimary),
                ColorDemo(name: "backgroundSecondary", color: .backgroundSecondary),
                ColorDemo(name: "backgroundSurface", color: .backgroundSurface),
            ]
        ),
        ColorSection(
            name: "\"On\"",
            colors: [
                ColorDemo(name: "onPrimary", color: .onPrimary),
                ColorDemo(name: "onPrimaryDisabled", color: .onPrimaryDisabled),
                ColorDemo(name: "onSecondary", color: .onSecondary),
                ColorDemo(name: "onSecondaryDisabled", color: .onSecondaryDisabled),
                ColorDemo(name: "onClean", color: .onClean),
                ColorDemo(name: "onCleanDisabled", color: .onCleanDisabled),
                ColorDemo(name: "onCleanSecondary", color: .onCleanSecondary),
                ColorDemo(name: "onCleanSecondaryDisabled", color: .onCleanSecondaryDisabled),
                ColorDemo(name: "onCta", color: .onCta),
                ColorDemo(name: "onCtaDisabled", color: .onCtaDisabled),
                ColorDemo(name: "onNonText", color: .onNonText),
                ColorDemo(name: "onSignal", color: .onSignal),
                ColorDemo(name: "onWaitlist", color: .onWaitlist),
            ]
        ),
        ColorSection(
            name: "\"On\" Background",
            colors: [
                ColorDemo(name: "onBackgroundEnabledOn", color: .onBackgroundEnabledOn),
                ColorDemo(name: "onBackgroundEnabledOff", color: .onBackgroundEnabledOff),
                ColorDemo(name: "onBackgroundDisabledOn", color: .onBackgroundDisabledOn),
                ColorDemo(name: "onBackgroundDisabledOff", color: .onBackgroundDisabledOff),
                ColorDemo(name: "onBackgroundPrimary", color: .onBackgroundPrimary),
                ColorDemo(name: "onBackgroundSecondary", color: .onBackgroundSecondary),
                ColorDemo(name: "onBackgroundDisabled", color: .onBackgroundDisabled),
            ]
        ),
        ColorSection(
            name: "\"On\" Surface",
            colors: [
                ColorDemo(name: "onSurfaceEnabledOn", color: .onSurfaceEnabledOn),
                ColorDemo(name: "onSurfaceEnabledOff", color: .onSurfaceEnabledOff),
                ColorDemo(name: "onSurfaceDisabledOn", color: .onSurfaceDisabledOn),
                ColorDemo(name: "onSurfaceDisabledOff", color: .onSurfaceDisabledOff),
                ColorDemo(name: "onSurfacePrimary", color: .onSurfacePrimary),
                ColorDemo(name: "onSurfaceSecondary", color: .onSurfaceSecondary),
                ColorDemo(name: "onSurfaceDisabled", color: .onSurfaceDisabled),
            ]
        ),
        ColorSection(
            name: "\"On\" Gradient",
            colors: [
                ColorDemo(name: "onGradientPrimary", color: .onGradientPrimary),
                ColorDemo(name: "onGradientSecondary", color: .onGradientSecondary),
                ColorDemo(name: "onGradientDisabled", color: .onGradientDisabled),
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
            ]
        ),
        ColorSection(
            name: "UI",
            colors: [
                ColorDemo(name: "border", color: .border),
                ColorDemo(name: "graphicalElements1", color: .graphicalElements1),
                ColorDemo(name: "graphicalElements2", color: .graphicalElements2),
                ColorDemo(name: "graphicalElements3", color: .graphicalElements3),
                ColorDemo(name: "shimmer", color: .shimmer),
                ColorDemo(name: "tabs", color: .tabs),
            ]
        ),
        ColorSection(
            name: "🔵 Blue Theme",
            colors: [
                ColorDemo(name: "bluePrimary", color: Color(ColorTheme.blue.primary)),
                ColorDemo(name: "bluePrimaryHighlight", color: Color(ColorTheme.blue.primaryHighlight)),
                ColorDemo(name: "bluePrimaryDisabled", color: Color(ColorTheme.blue.primaryDisabled)),

                ColorDemo(name: "blueSelection", color: Color(ColorTheme.blue.selection)),

                ColorDemo(name: "blueGradientStart", color: Color(ColorTheme.blue.backgroundTopStart)),
                ColorDemo(name: "blueGradientEnd", color: Color(ColorTheme.blue.backgroundTopEnd)),

                ColorDemo(name: "blueNavigation", color: Color(ColorTheme.blue.navigation)),
            ]
        ),
        ColorSection(
            name: "🥈 Silver Theme",
            colors: [
                ColorDemo(name: "silverPrimary", color: Color(ColorTheme.silver.primary)),
                ColorDemo(name: "silverPrimaryHighlight", color: Color(ColorTheme.silver.primaryHighlight)),
                ColorDemo(name: "silverPrimaryDisabled", color: Color(ColorTheme.silver.primaryDisabled)),

                ColorDemo(name: "silverSelection", color: Color(ColorTheme.silver.selection)),

                ColorDemo(name: "silverGradientStart", color: Color(ColorTheme.silver.backgroundTopStart)),
                ColorDemo(name: "silverGradientEnd", color: Color(ColorTheme.silver.backgroundTopEnd)),

                ColorDemo(name: "silverNavigation", color: Color(ColorTheme.silver.navigation)),
            ]
        ),
        ColorSection(
            name: "🥇 Gold Theme",
            colors: [
                ColorDemo(name: "goldPrimary", color: Color(ColorTheme.gold.primary)),
                ColorDemo(name: "goldPrimaryHighlight", color: Color(ColorTheme.gold.primaryHighlight)),
                ColorDemo(name: "goldPrimaryDisabled", color: Color(ColorTheme.gold.primaryDisabled)),

                ColorDemo(name: "goldSelection", color: Color(ColorTheme.gold.selection)),

                ColorDemo(name: "goldGradientStart", color: Color(ColorTheme.gold.backgroundTopStart)),
                ColorDemo(name: "goldGradientEnd", color: Color(ColorTheme.gold.backgroundTopEnd)),

                ColorDemo(name: "goldNavigation", color: Color(ColorTheme.gold.navigation)),
            ]
        ),
        ColorSection(
            name: "🏆 Platinum Theme",
            colors: [
                ColorDemo(name: "platinumPrimary", color: Color(ColorTheme.platinum.primary)),
                ColorDemo(
                    name: "platinumPrimaryHighlight",
                    color: Color(ColorTheme.platinum.primaryHighlight)
                ),
                ColorDemo(
                    name: "platinumPrimaryDisabled",
                    color: Color(ColorTheme.platinum.primaryDisabled)
                ),

                ColorDemo(name: "platinumSelection", color: Color(ColorTheme.platinum.selection)),
                ColorDemo(name: "platinumGradientStart", color: Color(ColorTheme.platinum.backgroundTopStart)),
                ColorDemo(name: "platinumGradientEnd", color: Color(ColorTheme.platinum.backgroundTopEnd)),

                ColorDemo(name: "platinumNavigation", color: Color(ColorTheme.platinum.navigation)),
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
                .overlay(hexOverlayLight(demo.color))
                .colorScheme(.light)

            demo.color
                .colorScheme(.dark)
        }
        .overlay(label())
        .frame(height: 80)
        .cornerRadius(8)
    }

    func hexOverlayLight(_ color: Color) -> some View {
        VStack {
            Spacer()
            HStack {
                hexLabel(color)
                Spacer()
            }
        }
        .padding(8)
    }

    func hexLabel(_ color: Color) -> some View {
        let text = UIColor(color).hexString ?? ""
        return Text(text)
            .font(.caption2)
            .foregroundColor(.white)
            .frame(alignment: .bottomLeading)
            .padding(4)
            .background(Color.black.opacity(0.4))
            .cornerRadius(4)
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
