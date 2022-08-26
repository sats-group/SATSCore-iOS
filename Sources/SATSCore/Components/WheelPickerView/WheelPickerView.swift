import SwiftUI

public struct WheelPickerView: View {
    @Binding public var value: Int

    private let circleThreshold: CGFloat = 300.0
    private let knobPadding: CGFloat = 10.0

    @State private var angleValue: CGFloat
    @State private var numberOfRounds: CGFloat
    @State private var previousAngleValue: CGFloat = 0.0

    private let config: WheelConfig
    private let hapticGenerator: UINotificationFeedbackGenerator

    public init(
        config: WheelConfig,
        value: Binding<Int>,
        hapticGenerator: UINotificationFeedbackGenerator = .init()
    ) {
        self.config = config
        _value = value

        let floatValue = CGFloat(value.wrappedValue)
        let remainder = floatValue.truncatingRemainder(dividingBy: config.totalValue)
        let angle = 360 * remainder / config.totalValue
        self.angleValue = angle
        self.numberOfRounds = (floatValue / config.totalValue).rounded(.down)

        self.hapticGenerator = hapticGenerator
    }

    public var body: some View {
        ZStack {
            backgroundCircle
            ticks
            progressLine
            knob
            label
        }
        .onChange(of: value, perform: handleHaptic)
        .pickerShadow
    }

    private var backgroundCircle: some View {
        Circle()
            .fill(Color.backgroundSurfacePrimary)
            .frame(width: config.radius * 2, height: config.radius * 2)
            .scaleEffect(1.1)
    }

    private var ticks: some View {
        Circle()
            .stroke(
                Color.graphicalElements3,
                style: .init(
                    lineWidth: config.sizeOfTicks,
                    lineCap: .round,
                    dash: dashes()
                )
            )
            .frame(width: config.radius * 2, height: config.radius * 2)
    }

    private var progressLine: some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(value) / config.totalValue)
            .stroke(
                Color.graphicalElements5,
                style: .init(
                    lineWidth: lineWidth(),
                    lineCap: .round
                )
            )
            .frame(width: config.radius * 2, height: config.radius * 2)
            .rotationEffect(.degrees(-90))
            .pickerShadow
    }

    private var knob: some View {
        Circle()
            .fill(Color.graphicalElements5)
            .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
            .padding(knobPadding)
            .offset(y: -config.radius)
            .rotationEffect(Angle.degrees(Double(angleValue)))
            .gesture(DragGesture(minimumDistance: 0.0)
                .onChanged({ value in
                    change(location: value.location)
                })
            )
            .pickerShadow
    }

    @ViewBuilder
    private var label: some View {
        if let label = config.label {
            Text("\(value) \(label)")
                .satsFont(.h1, weight: .emphasis)
                .foregroundColor(.onSurfacePrimary)
        }
    }

    private func dashes() -> [CGFloat] {
        let totalSpace = 2 * Double.pi * config.radius
        let spaceLeft = totalSpace - (config.sizeOfTicks * config.numberOfTicks)
        let dashSpace = spaceLeft / config.numberOfTicks
        return [config.sizeOfTicks, dashSpace]
    }

    private func lineWidth() -> CGFloat {
        let maxWidth = 12.0
        let currentWidth = 6 + numberOfRounds
        return currentWidth <= maxWidth ? currentWidth : maxWidth
    }

    private func change(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: location.y)

        let angleInRadians = atan2(
            vector.dy - (config.knobRadius + knobPadding),
            vector.dx - (config.knobRadius + knobPadding)
        ) + .pi / 2.0

        let fixedAngle = angleInRadians < 0.0 ? angleInRadians + 2.0 * .pi : angleInRadians

        let previousAngle = angleValue
        let angleInDegrees = fixedAngle * 180 / .pi

        var numRounds = numberOfRounds
        if angleInDegrees - previousAngle < -circleThreshold {
            numRounds += 1
        }
        if angleInDegrees - previousAngle > circleThreshold {
            numRounds -= 1
        }
        let calculatedValue = numRounds * config.totalValue + angleInDegrees / config.circleMultiplier

        guard calculatedValue > config.minValue, calculatedValue < config.maxValue else { return }

        previousAngleValue = previousAngle
        angleValue = angleInDegrees
        numberOfRounds = numRounds
        value = Int(calculatedValue)
    }

    private func handleHaptic(value: Int) {
        let modulo = Int(config.totalValue / config.numberOfTicks)
        if value % modulo == 0 {
            hapticGenerator.notificationOccurred(.success)
        }
    }
}

private extension View {
    var pickerShadow: some View {
        shadow(color: .black.opacity(0.12), radius: 12, x: 0, y: 0)
    }
}
