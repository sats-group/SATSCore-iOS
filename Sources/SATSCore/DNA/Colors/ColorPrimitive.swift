import SwiftUI

public enum ColorPrimitive: String, Equatable, CaseIterable {
    // MARK: - Brand Primitive

    case satsBlue100     = "#0D2134"
    /// this is derived from satsBlue, but it's a named brand color
    case satsBlueGrey80  = "#404D5B"
    case satsBlue70      = "#566471"
    case satsBlue40      = "#9EA6AE"
    case satsBlue20      = "#CFD3D6"
    /// this is derived from satsBlue, but it's a named brand color
    case satsLightGray15 = "#DCDEE0"
    case satsBlue5       = "#F3F4F5"

    case satsCoral170 = "#4B190F"
    case satsCoral130 = "#AF3A24"
    case satsCoral120 = "#C84229"
    case satsCoral100 = "#FA5333"
    case satsCoral90  = "#FB6447"
    case satsCoral40  = "#FDBAAD"
    case satsCoral10  = "#FFEEEB"

    // MARK: - Neutral Primitives

    case black100 = "#000000"
    case black90  = "#1A1A1A"
    case black85  = "#262626"
    case black80  = "#333333"
    case black70  = "#4C4C4C"
    case black60  = "#666666"
    case black50  = "#808080"
    case black40  = "#999999"
    case black20  = "#CCCCCC"
    case black5   = "#F2F2F2"
    case black3   = "#FEFFFF"

    case white100 = "#FFFFFF"
    case white90  = "#FFFFFFE5"
    case white85  = "#FFFFFFD9"
    case white80  = "#FFFFFFCC"
    case white70  = "#FFFFFFB2"
    case white65  = "#FFFFFFA6"
    case white60  = "#FFFFFF99"
    case white50  = "#FFFFFF80"
    case white20  = "#FFFFFF33"
    case white15  = "#FFFFFF26"
    case white10  = "#FFFFFF1A"
    case white5   = "#FFFFFF0D"

    // MARK: - Color Primitives

    case cardinal170 = "#381115"
    case cardinal120 = "#942E39"
    case cardinal100 = "#B93947"
    case cardinal60  = "#D58891"
    case cardinal30  = "#EAC4C8"
    case cardinal10  = "#F8EBED"

    case springGreen170 = "#03261A"
    case springGreen120 = "#076646"
    case springGreen100 = "#097F58"
    case springGreen80  = "#3A9979"
    case springGreen30  = "#B5D9CD"
    case springGreen10  = "#E6F2EE"

    case gold170 = "#443716"
    case gold140 = "#866C2A"
    case gold130 = "#9E8034"
    case gold110 = "#CCA442"
    case gold100 = "#E2B74A"
    case gold80  = "#E7C46D"
    case gold30  = "#F3E6C5"
    case gold10  = "#F8F3E8"

    case chiliRed170 = "#410F0B"
    case chiliRed120 = "#AE281E"
    case chiliRed100 = "#D93226"
    case chiliRed80  = "#E15B51"
    case chiliRed60  = "#E8847D"
    case chiliRed10  = "#FBEAE9"

    case egyptianPurple160 = "#161638"
    case egyptianPurple100 = "#37378B"
    case egyptianPurple80  = "#5F5FA2"
    case egyptianPurple60  = "#8787B9"
    case egyptianPurple10  = "#EBEBF3"

    case brightBlue160 = "#0F2F46"
    case brightBlue110 = "#226A9E"
    case brightBlue100 = "#2676B0"
    case brightBlue80  = "#5191C0"
    case brightBlue60  = "#7DADD0"

    case uranianBlue100 = "#70C4FF"
    case uranianBlue70  = "#9BD6FF"

    case salmonPink100 = "#FF7083"
    case salmonPink70  = "#FF9BA8"

    case celadon100 = "#65E694"
    case celadon70  = "#93EEB4"

    case tangerine100 = "#FBA000"
    case tangerine70  = "#FCBC4D"

    case caribbeanCurrent100 = "#065D63"
    case caribbeanCurrent70  = "#4E7E81"
}

public extension ColorPrimitive {
    var name: String {
        String(describing: self)
    }

    var uiColor: UIColor {
        .init(hex: rawValue)
    }

    var color: Color {
        .init(uiColor: uiColor)
    }
}

extension UIColor {
    public convenience init(hex: String) {
        let red, green, blue, alpha: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red   = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue  = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: red, green: green, blue: blue, alpha: alpha)
                    return
                }
            }

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red   = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blue  = CGFloat((hexNumber & 0x0000ff)) / 255
                    alpha = 1.0

                    self.init(red: red, green: green, blue: blue, alpha: alpha)
                    return
                }
            }
        }

        fatalError("❌ we couldn't convert \(hex) to a UIColor")
    }
}

extension Color {
    public init(hex: String) {
        let red, green, blue, alpha: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red   = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue  = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
                    return
                }
            }

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red   = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blue  = CGFloat((hexNumber & 0x0000ff)) / 255
                    alpha = 1.0

                    self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
                    return
                }
            }
        }

        fatalError("❌ we couldn't convert \(hex) to a UIColor")
    }

}
