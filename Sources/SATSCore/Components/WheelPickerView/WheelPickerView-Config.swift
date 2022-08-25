import CoreGraphics

public extension WheelPickerView {
    struct WheelConfig {
            /// The minimum value the picker will allow
        let minValue: CGFloat
            /// The maximum value the picker will allow
        let maxValue: CGFloat
            /// The value of one full circle
        let totalValue: CGFloat
            /// The radius of the turning knob
        let knobRadius: CGFloat
            /// The radius of the dial
        let radius: CGFloat
            /// The number of how many ticks the dial will have
        let numberOfTicks: CGFloat
            /// The size of the ticks on the dial
        let sizeOfTicks: CGFloat
            /// The label to put after the value. E.g. km or min.
            /// If absent there will be no text on the dial.
        let label: String?

        public init(
            minValue: CGFloat,
            maxValue: CGFloat,
            totalValue: CGFloat,
            knobRadius: CGFloat,
            radius: CGFloat,
            numberOfTicks: CGFloat,
            sizeOfTicks: CGFloat,
            label: String?
        ) {
            self.minValue = minValue
            self.maxValue = maxValue
            self.totalValue = totalValue
            self.knobRadius = knobRadius
            self.radius = radius
            self.numberOfTicks = numberOfTicks
            self.sizeOfTicks = sizeOfTicks
            self.label = label
        }

        public var circleMultiplier: CGFloat {
            360.0 / totalValue
        }

        public static func minutes(label: String? = nil) -> Self {
            .init(
                minValue: 0,
                maxValue: 60 * 12,
                totalValue: 60,
                knobRadius: 15,
                radius: 110,
                numberOfTicks: 12,
                sizeOfTicks: 4,
                label: label
            )
        }

        public static func kilometers(label: String? = nil) -> Self {
            .init(
                minValue: 0,
                maxValue: 1000,
                totalValue: 40,
                knobRadius: 15,
                radius: 110,
                numberOfTicks: 8,
                sizeOfTicks: 4,
                label: label
            )
        }
    }
}
