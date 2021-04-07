buildNumber=$1
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" Sats-MemberApp/Resources/Plists/Info.plist