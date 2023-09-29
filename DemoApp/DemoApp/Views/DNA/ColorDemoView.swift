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
            name: "Action",
            colors: [
                ColorDemo(name: "action", color: .action),
                ColorDemo(name: "actionHighlight", color: .actionHighlight),
                ColorDemo(name: "actionDisabled", color: .actionDisabled),
            ]
        ),
        ColorSection(
            name: "Clean",
            colors: [
                ColorDemo(name: "clean", color: .clean),
                ColorDemo(name: "cleanHighlight", color: .cleanHighlight),
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
                ColorDemo(name: "backgroundSurfacePrimary", color: .backgroundSurfacePrimary),
                ColorDemo(name: "backgroundSurfaceSecondary", color: .backgroundSurfaceSecondary),
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
                ColorDemo(name: "onRewards", color: .onRewards),
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
            name: "Signal",
            colors: [
                ColorDemo(name: "signalSuccess", color: .signalSuccess),
                ColorDemo(name: "signalWarning", color: .signalWarning),
                ColorDemo(name: "signalDelete", color: .signalDelete),
                ColorDemo(name: "signalError", color: .signalError),
            ]
        ),
        ColorSection(
            name: "Signal text",
            colors: [
                ColorDemo(name: "signalSuccessText", color: .signalSuccessText),
                ColorDemo(name: "signalWarningText", color: .signalWarningText),
                ColorDemo(name: "signalDeleteText", color: .signalDeleteText),
                ColorDemo(name: "signalErrorText", color: .signalErrorText),
            ]
        ),
        ColorSection(
            name: "Others",
            colors: [
                ColorDemo(name: "waitlist", color: .waitlist),
                ColorDemo(name: "waitlistHighlight", color: .waitlistHighlight),
                ColorDemo(name: "challengeFailed", color: .challengeFailed),
                ColorDemo(name: "challengeInProgress", color: .challengeInProgress),
                ColorDemo(name: "challengeNotDone", color: .challengeNotDone),
                ColorDemo(name: "challengeSuccess", color: .challengeSuccess),
            ]
        ),
        ColorSection(
            name: "UI",
            colors: [
                ColorDemo(name: "border", color: .border),
                ColorDemo(name: "graphicalElements1", color: .graphicalElements1),
                ColorDemo(name: "graphicalElements2", color: .graphicalElements2),
                ColorDemo(name: "graphicalElements3", color: .graphicalElements3),
                ColorDemo(name: "graphicalElements4", color: .graphicalElements4),
                ColorDemo(name: "graphicalElements5", color: .graphicalElements5),
                ColorDemo(name: "graphicalElements6", color: .graphicalElements6),
                ColorDemo(name: "graphicalElements7", color: .graphicalElements7),
                ColorDemo(name: "shimmer", color: .shimmer),
                ColorDemo(name: "tabs", color: .tabs),
                ColorDemo(name: "navigation", color: .navigation),
            ]
        ),
        ColorSection(
            name: "Workout",
            colors: [
                ColorDemo(name: "workoutPt", color: .workoutPt),
                ColorDemo(name: "workoutGx", color: .workoutGx),
                ColorDemo(name: "workoutGymfloor", color: .workoutGymfloor),
                ColorDemo(name: "workoutOwnTraining", color: .workoutOwnTraining),
            ]
        ),
        ColorSection(
            name: "Rewards",
            colors: [
                ColorDemo(name: "rewardsBlue", color: .rewardsBlue),
                ColorDemo(name: "rewardsSilver", color: .rewardsSilver),
                ColorDemo(name: "rewardsGold", color: .rewardsGold),
                ColorDemo(name: "rewardsPlatinum", color: .rewardsPlatinum),
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
                .overlay(hexLabel(demo.color), alignment: .bottomLeading)
                .colorScheme(.light)

            demo.color
                .colorScheme(.dark)
        }
        .overlay(label())
        .frame(height: 80)
        .cornerRadius(8)
    }

    func hexLabel(_ color: Color) -> some View {
        let text = UIColor(color).hexString ?? "Unknown"

        return Text(text)
            .font(.caption2)
            .foregroundColor(.white)
            .frame(alignment: .bottomLeading)
            .padding(.spacingXXS)
            .background(Color.black.opacity(0.4))
            .cornerRadius(4)
            .padding(.spacingXS)
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
    }
}
