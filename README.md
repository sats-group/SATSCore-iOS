<p align="center"><img width=100% src="https://i.imgur.com/DI2AIpj.png"></p>

The objective of this library is to provide all the utilities we need to create UI for the SATS member app by implementing the design system we use, then when building UI we just care of combining this basic elements rather than re-invent everything and also to provide a solid base that allows support to advanced UI features like: dark mode, dynamic types and so on.

This library defines Fonts, Colors and other base components and configurations to create UI. This applies to both `UIKit` and `SwiftUI`based UI.

⚠️ We opted to create this library directly as an SPM package, since we believe is the future way of handling packages over CocoaPods. This has benefits as well tradeoffs.

## Usage

```swift
import SATSCore
```

In `AppDelegate` you should call

```swift
SATSFont.registerCustomFonts()
```

### UIKit

Since the library provides both `UIKit` and `SwiftUI` utilities, we need to avoid names like `Label` or `Button` as they will clash with SwiftUI’s types. In the case of UIKit, the way to define text and buttons would be respectively to use:

- `SATSButton`
- `SATSLabel`

Both components come already configured with the styles defined in the new design system. There may still be some designs that have not been ported to the new style, so we will do this gradually.

### SwiftUI

To use fonts, you can do

```swift
Text("Hello World")
    .satsFont(.h1)
```

`.satsFont` is a method as you can invoke it like `.satsFont(.h1, weight: .emphasis)` for a semi-bold variation of the semantic `H1` text.

### Shared

To use colors part of the design system, we have included a bunch of extensions to `UIColor` and `Color` respectively, which define all the semantic colors we should use. We should never use a color by name, like `Color.white`, instead we can use:

```swift
Color.backgroundPrimary
Color.backgroundSecondary
Color.buttonPrimary
Color.onPrimary // text or icons on top of button primary color
Color.selection
Color.waitlist
// etc.
``` 

In `UIKit` this would be a common scenario

```swift
view.backgroundColor = .backgroundSecondary // UIColor.backgroundSecondary
```

## Development

If you want to edit the package on its own you can just open `Package.swift`, which will open the package in stand-alone mode in Xcode.

The best way to develop the package is to open the demo app Xcode project

```
~/Code/SATSCore$ xed DemoApp
```

This is one of the tradeoffs of using SwiftPackageManager, in standalone packages we cannot have demo apps, neither configure Xcode to run SwiftLint. So we added this to the DemoApp.

## Releasing

In order to release a new version of the package (and SATSCore iOS app) we just need to add a tag in the [Releases section](https://github.com/healthfitnessnordic/SATSCore-iOS/releases).

Then make sure the `Tag` and `Title` of the release is in the form `0.0.8` or similar as this number is used by SPM to define the version.

Then if you have `pr_changelog` installed (`gem install pr_changelog`), you can run a command like

```
$ pr_changelog 0.0.7 main
```

To get a formatted list of changes. Remember to replace `0.0.7` for the last released version of the package.
