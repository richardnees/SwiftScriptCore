#!/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift

import Foundation
import SwiftScriptCore
import Bash

class ConfigurationTool {
    
    func run() {
        XcodeLogger.output(message: "Detected platform:", type: .note)
        XcodeLogger.output(message: XcodeEnvironment.platformName.rawValue, type: .note, indentation: 1)
        XcodeLogger.output(message: "Detected configuration:", type: .note)

        if let configurationName = XcodeEnvironment.configurationName {
            XcodeLogger.output(message: configurationName, type: .note, indentation: 1)
        } else {
            XcodeLogger.output(message: "Missing configuration", type: .error, indentation: 1)
        }

        if let infoPlistURL = XcodeEnvironment.infoPlistURL {
            XcodeLogger.output(message: infoPlistURL.path, type: .note, indentation: 1)
            
            if let infoPlist = NSDictionary(contentsOf: infoPlistURL) {
                XcodeLogger.output(message: "Info Plist:", type: .note)
                
                for (key, value) in infoPlist {
                    XcodeLogger.output(message: String(describing: key), type: .note, indentation: 1)
                    XcodeLogger.output(message: String(describing: value), type: .note, indentation: 2)
                }
            }
        } else {
            XcodeLogger.output(message: "Missing infoPlistURL", type: .error, indentation: 1)
        }
        
        XcodeLogger.output(message: "Git:", type: .note)
        XcodeLogger.output(message: "Branch:\t\t\(Git.currentBranch)", type: .note, indentation: 1)
        XcodeLogger.output(message: "Hash:\t\t\(Git.currentCommitHash)", type: .note, indentation: 1)
        XcodeLogger.output(message: "Count:\t\t\(Git.commitCount)", type: .note, indentation: 1)

//        XcodeLogger.output(message: "Here is a warning!", type: .warning)
//        XcodeLogger.output(message: "Here is an error!", type: .error)

    }
}

ConfigurationTool().run()
