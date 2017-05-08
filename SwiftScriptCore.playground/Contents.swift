//: Playground - noun: a place where people can play

import Cocoa
import SwiftScriptCore

let environmentVariables = XcodeEnvironment.environmentVariables

if let frameworkSearchPaths = XcodeEnvironment.environmentVariable(for: .dyldFrameworkPath)?.components(separatedBy: ":") {
    frameworkSearchPaths.forEach {
        print($0)
    }
}

let directoryContent = Bash.run(command: "/bin/ls", arguments: ["-la"])
print(directoryContent)
