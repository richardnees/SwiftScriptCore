#!/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift

import Foundation
import SwiftScriptCore
import Bash

class ConfigurationTool {
    
    func run() {
        XcodeLog.output(message: "Detected platform:", type: .note)
        XcodeLog.output(message: XcodeEnv.platformName.rawValue, type: .note, indentation: 1)
        XcodeLog.output(message: "Detected configuration:", type: .note)

        if let configurationName = XcodeEnv.configurationName {
            XcodeLog.output(message: configurationName, type: .note, indentation: 1)
        } else {
            XcodeLog.output(message: "Missing configuration", type: .error, indentation: 1)
        }

        if let infoPlistURL = XcodeEnv.infoPlistURL {
            XcodeLog.output(message: infoPlistURL.path, type: .note, indentation: 1)
            
            if let infoPlist = NSDictionary(contentsOf: infoPlistURL) {
                XcodeLog.output(message: "Info Plist:", type: .note)
                
                for (key, value) in infoPlist {
                    XcodeLog.output(message: String(describing: key), type: .note, indentation: 1)
                    XcodeLog.output(message: String(describing: value), type: .note, indentation: 2)
                }
            }
        } else {
            XcodeLog.output(message: "Missing infoPlistURL", type: .error, indentation: 1)
        }
        
        let git = Git(gitDirectoryPath: XcodeEnv.sourceRootURL!.path)
        XcodeLog.output(message: "Git:", type: .note)
        XcodeLog.output(message: "Branch:\t\t\(git.currentBranch)", type: .note, indentation: 1)
        XcodeLog.output(message: "Hash:\t\t\(git.currentCommitHash)", type: .note, indentation: 1)
        XcodeLog.output(message: "Count:\t\t\(git.commitCount)", type: .note, indentation: 1)

//        XcodeLog.output(message: "Here is a warning!", type: .warning)
//        XcodeLog.output(message: "Here is an error!", type: .error)

    }
}

ConfigurationTool().run()
