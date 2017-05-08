#!/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift

import Foundation
import SwiftScriptCore

class ConfigurationTool {
    
    func run() {
        XcodeLogger.output(message: "Welcome to CarthageTool", type: .note)
        XcodeLogger.output(message: "Detected platform:", type: .note)
        XcodeLogger.output(message: XcodeEnvironment.platformName.rawValue, type: .note, indentation: 1)
        XcodeLogger.output(message: "Detected configuration:", type: .note)
        if let configurationName = XcodeEnvironment.configurationName {
            XcodeLogger.output(message: configurationName, type: .note, indentation: 1)
        } else {
            XcodeLogger.output(message: "Missing configuration", type: .error, indentation: 1)
        }
        
    }
}

ConfigurationTool().run()
