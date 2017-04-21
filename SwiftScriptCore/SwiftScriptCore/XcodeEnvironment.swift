import Foundation

public class XcodeEnvironment {
    
    public static var environmentVariables: [String : String] {
        return ProcessInfo.processInfo.environment
    }
    
    public static func environmentVariable(for rawValue: String) -> String? {
        guard let environmentVariable = XcodeEnvironment.environmentVariables
            .filter({ $0.0 == rawValue })
            .map({ $0.1 })
            .first
            else {
                XcodeLogger.output(message: "Environment doesn't provide \(rawValue)", type: .error, line: #line)
            return nil
        }
        return environmentVariable
    }
    
    public static func environmentVariable(for key: XcodeEnvironment.Key) -> String? {
        return XcodeEnvironment.environmentVariable(for: key.rawValue)
    }
    
    public static var targetName: String? {
        return XcodeEnvironment.environmentVariable(for: .targetName)
    }
    
    public static var sourceRootURL: URL? {
        guard let sourceRootPath = XcodeEnvironment.environmentVariable(for: .sourceRoot) else { return nil }
        return URL(fileURLWithPath: sourceRootPath)
    }
    
    public static var platformName: PlatformName {
        guard
            let rawPlatformName = XcodeEnvironment.environmentVariable(for: .platformName),
            let platformName = PlatformName(rawValue: rawPlatformName)
            else { return .unsupported }
        return platformName
    }
    
    public static var builtProductsFolderURL: URL? {
        guard let builtProductsFolderPath = XcodeEnvironment.environmentVariable(for: .builtProductsDir) else { return nil }
        return URL(fileURLWithPath: builtProductsFolderPath)
    }
    
    public static var frameworksFolderPathComponent: String? {
        return XcodeEnvironment.environmentVariable(for: .frameworksFolderPath)
    }
    
    public static var frameworksFolderURL: URL? {
        guard let frameworksFolderPathComponent = frameworksFolderPathComponent else { return nil }
        return XcodeEnvironment.builtProductsFolderURL?.appendingPathComponent(frameworksFolderPathComponent)
    }
}

// MARK: - Deprecated

extension XcodeEnvironment {
    
    @available(*, deprecated)
    public static func environmentVariable(forKey key: String) -> String? {
        return XcodeEnvironment.environmentVariable(for: key)
    }
}
