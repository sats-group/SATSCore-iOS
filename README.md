# SATSCore

A base UI framework.

The objective of this library is to provide all the utilities we need to create UI for the SATS member app by implementing the design system we use, then when building UI we just care of combining this basic elements rather than re-invent everything and also to provide a solid base that allows support to advanced UI features like: dark mode, dynamic types and so on.

This library defines Fonts, Colors and other base components and configurations to create UI. This applies to both `UIKit` and `SwiftUI`based UI.

⚠️ I opted to create this library directly as an SPM package, since I believe is the future way of handling packages over CocoaPods. This has benefits as well tradeoffs.

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
    .font(.satsH1())
```

`.satsH1`is a method as you can invoke it like `.satsH1(variant: .emphasis)` for a semi-bold variation of the semantic `H1` text.

### Shared

To use colors part of the design system, we have included a bunch of extensions to `UIColor` and `Color` respectively, which define all the semantic colors we should use. We should never use a color by name, like `Color.white`, instead we can use:

```swift
Color.backgroundPrimary
Color.backgroundSecondary
Color.buttonPrimary
Color.onButtonPrimary // text or icons on top of button primary color
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
~/Code/SATSCore$ cd DemoApp
~/Code/SATSCore/DemoApp$ xed .
```

This is one of the tradeoffs of using SwiftPackageManager, in standalone packages we cannot have demo apps, neither configure Xcode to run SwiftLint. So I added this to the DemoApp.
