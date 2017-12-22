import Foundation

public class XcodeEnv {
    
    public static var environmentVariables: [String : String] {
        return ProcessInfo.processInfo.environment
    }
    
    public static func environmentVariable(for rawValue: String) -> String? {
        guard let environmentVariable = XcodeEnv.environmentVariables
            .filter({ $0.0 == rawValue })
            .map({ $0.1 })
            .first
            else {
                XcodeLog.output(message: "Environment doesn't provide \(rawValue)", type: .error, line: #line)
            return nil
        }
        return environmentVariable
    }
    
    public static func environmentVariable(for key: XcodeEnv.Key) -> String? {
        return XcodeEnv.environmentVariable(for: key.rawValue)
    }
}

// MARK: - Build Settings Convenience

extension XcodeEnv {

    public static var builtProductsFolderURL: URL? {
        guard let builtProductsFolderPath = XcodeEnv.environmentVariable(for: .builtProductsDir) else { return nil }
        return URL(fileURLWithPath: builtProductsFolderPath)
    }
    
    public static var configurationName: String? {
        return XcodeEnv.environmentVariable(for: .configurationName)
    }
    
    public static var frameworksFolderPathComponent: String? {
        return XcodeEnv.environmentVariable(for: .frameworksFolderPath)
    }
    
    public static var frameworksFolderURL: URL? {
        guard let frameworksFolderPathComponent = frameworksFolderPathComponent else { return nil }
        return XcodeEnv.builtProductsFolderURL?.appendingPathComponent(frameworksFolderPathComponent)
    }

    public static var infoPlistURL: URL? {
        guard
            let sourceRoot = XcodeEnv.environmentVariable(for: .sourceRoot),
            let infoPlistFile = XcodeEnv.environmentVariable(for: .infoPlistFile)
            else { return nil }
            let sourceRootURL = URL(fileURLWithPath: sourceRoot)
            let infoPlistURL = sourceRootURL.appendingPathComponent(infoPlistFile)
        
        guard FileManager.default.fileExists(atPath: infoPlistURL.path) else { return nil }
        
        return infoPlistURL
    }

    public static var platformName: PlatformName {
        guard
            let rawPlatformName = XcodeEnv.environmentVariable(for: .platformName),
            let platformName = PlatformName(rawValue: rawPlatformName)
            else { return .unsupported }
        return platformName
    }
    
    public static var sourceRootURL: URL? {
        guard let sourceRootPath = XcodeEnv.environmentVariable(for: .sourceRoot) else { return nil }
        return URL(fileURLWithPath: sourceRootPath)
    }

    public static var targetName: String? {
        return XcodeEnv.environmentVariable(for: .targetName)
    }
}

// MARK: - Deprecated

extension XcodeEnv {
    
    @available(*, deprecated)
    public static func environmentVariable(forKey key: String) -> String? {
        return XcodeEnv.environmentVariable(for: key)
    }
}
