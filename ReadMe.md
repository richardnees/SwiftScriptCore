# SwiftScriptCore

macOS framework to support macOS apps and Swift scripts

It currently supports:

- **Bash**/**Shell** *run command line tools and return output*
- **XcodeEnvironment** *access Xcode environment variables*
- **XcodeLogger** *formatted logging with file/line support and warning/error highlighting*

#### Requirements:
- macOS 10.13 Sierra or later
- Xcode 9.0 or later
- Swift 4.0

#### macOS setup
Just embed as usual

#### Xcode Swift script phase setup
When running a swift script we invoke **swift** with **xcrun** to pass:

- **--toolchain com.apple.dt.toolchain.Default** *i.e. Swift 4*
- **--sdk macosx** *To ensure we get the macOS Foundation*

We pass the following to **swift**:

- **--target x86_64-apple-macosx10.13** *i.e. the current minimum deployment target of SwiftScriptCore*
- **-F \<path\_to\_module_location>** *the enclosing folder of SwiftScriptCore.framework*
- **\<path\_to\_swift\_script>**

Example:
`/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift -target x86_64-apple-macosx10.13 -F "${SRCROOT}/Scripts/" "${SRCROOT}/Scripts/Tool.swift"`

The swift script **#!**:

`\#!/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift`

