//
//  ColorsView.swift
//  DemoApp
//
//  Created by Felipe Espinoza on 19/01/2021.
//

import SwiftUI
import SATSCore

/*
- Brand
- IconsPositive
- IconsNegative
- SignalPositive
- SignalNegative
- TypoNegative
- TypoPositive
- UINegative
- UIPositive
- ButtonNegative
- ButtonPositive
*/

struct ColorsView: View {
    var body: some View {
        List {
            ColorSectionView<ColorTheme.Brand>(expanded: true)

            Group {
                ColorSectionView<ColorTheme.IconsPositive>()
                ColorSectionView<ColorTheme.IconsNegative>()
            }

            Group {
                ColorSectionView<ColorTheme.SignalPositive>()
                ColorSectionView<ColorTheme.SignalNegative>()
            }

            Group {
                ColorSectionView<ColorTheme.TypoNegative>()
                ColorSectionView<ColorTheme.TypoPositive>()
            }

            Group {
                ColorSectionView<ColorTheme.UINegative>()
                ColorSectionView<ColorTheme.UIPositive>()
            }

            Group {
                ColorSectionView<ColorTheme.ButtonNegative>()
                ColorSectionView<ColorTheme.ButtonPositive>()
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Colors")
    }
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView()
    }
}

protocol ColorSection: CaseIterable, Identifiable {
    static var name: String { get }
    var rawValue: String { get }
    var color: UIColor { get }
}

extension ColorSection {
    public var id: String { rawValue }
}

extension ColorTheme.Brand: ColorSection {
    static var name: String = "Brand"
}

extension ColorTheme.IconsPositive: ColorSection {
    static var name: String = "IconsPositive"
}

extension ColorTheme.IconsNegative: ColorSection {
    static var name: String = "IconsNegative"
}

extension ColorTheme.SignalPositive: ColorSection {
    static var name: String = "SignalPositive"
}

extension ColorTheme.SignalNegative: ColorSection {
    static var name: String = "SignalNegative"
}

extension ColorTheme.TypoNegative: ColorSection {
    static var name: String = "TypoNegative"
}

extension ColorTheme.TypoPositive: ColorSection {
    static var name: String = "TypoPositive"
}

extension ColorTheme.UINegative: ColorSection {
    static var name: String = "UINegative"
}

extension ColorTheme.UIPositive: ColorSection {
    static var name: String = "UIPositive"
}

extension ColorTheme.ButtonNegative: ColorSection {
    static var name: String = "ButtonNegative"
}

extension ColorTheme.ButtonPositive: ColorSection {
    static var name: String = "ButtonPositive"
}

struct ColorSectionView<ColorType: ColorSection>: View where ColorType.AllCases: RandomAccessCollection {
    @State var expanded: Bool = false

    var body: some View {
        Section {
            DisclosureGroup(ColorType.name, isExpanded: $expanded) {
                ForEach(ColorType.allCases) { colorName in
                    ColorRowView(
                        name: colorName.rawValue,
                        color: Color(colorName.color)
                    )
                    .contentShape(Rectangle())
                }
            }
        }
    }
}

struct ColorRowView: View {
    let name: String
    let color: Color

    var body: some View {
        Text(name)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(UIColor.systemBackground.withAlphaComponent(0.3)))
            .cornerRadius(4)
            .padding()
            .frame(maxWidth: .greatestFiniteMagnitude)
            .background(color)
            .cornerRadius(8)
    }
}

struct ColorRowView_Previews: PreviewProvider {
    static let primaryColor = ColorTheme.Brand.primary
    static let typoPrimary = ColorTheme.TypoNegative.primary

    static var previews: some View {
        Group {
            ColorRowView(name: primaryColor.rawValue, color: Color(primaryColor.color))

            ColorRowView(name: typoPrimary.rawValue, color: Color(typoPrimary.color))

            ColorRowView(name: primaryColor.rawValue, color: Color(primaryColor.color))
                .colorScheme(.dark)

            ColorRowView(name: typoPrimary.rawValue, color: Color(typoPrimary.color))
                .colorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
