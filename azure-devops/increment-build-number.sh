buildNumber=$1
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" DemoApp/DemoApp/App/Info.plist
