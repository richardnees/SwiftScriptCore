import Cocoa
import SwiftScriptCore

//: Xcode Environment Variables

let environmentVariables = XcodeEnvironment.environmentVariables

//: Framework Search Paths

if let frameworkSearchPaths = XcodeEnvironment.environmentVariable(for: .dyldFrameworkPath)?.components(separatedBy: ":") {
    frameworkSearchPaths.forEach { _ in
    }
}

//: Run /bin/ls

let directoryContent = Bash.run(command: "/bin/ls", arguments: ["-la", "/Applications"])

