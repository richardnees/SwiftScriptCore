# SwiftScriptCore

macOS framework to support macOS apps and Swift scripts

It currently supports:

- **Bash**/**Process extenssion** *run command line tools and return output*
- **XcodeEnv** *access Xcode environment variables*
- **XcodeLog** *formatted logging with file/line support and warning/error highlighting*

#### Requirements:
- macOS 10.13 High Sierra or later
- Xcode 10.0 or later
- Swift 4.2

#### macOS setup
Just embed as usual

#### Swift script setup
When running a swift script we invoke **swift** with **xcrun** to pass:

- **--toolchain com.apple.dt.toolchain.Default** *i.e. Swift 4*
- **--sdk macosx** *To ensure we get the macOS Foundation*

We pass the following to **swift**:

- **--target x86_64-apple-macosx10.14** *i.e. the current minimum deployment target of SwiftScriptCore*
- **-F \<path\_to\_module_location>** *the enclosing folder of SwiftScriptCore.framework*
- **\<path\_to\_swift\_script>**

Example:
`/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift -target x86_64-apple-macosx10.14 -F "${SRCROOT}/Scripts/" "${SRCROOT}/Scripts/Tool.swift"`

The swift script **#!**:

`\#!/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift`

