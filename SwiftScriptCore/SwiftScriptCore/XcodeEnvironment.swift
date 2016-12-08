import Foundation

public class XcodeEnvironment {
    
    public static var environmentVariables: [String : String] {
        return ProcessInfo.processInfo.environment
    }
    
    public static func environmentVariable(forKey key: String) -> String? {
        guard let environmentVariable = XcodeEnvironment.environmentVariables.filter({ $0.0 == key }).map({ $0.1 }).first else {
            XcodeLogger.output(message: "Environment doesn't provide \(key)", type: .error, line: #line)
            return nil
        }
        return environmentVariable
    }
    
    public static var targetName: String? {
        return XcodeEnvironment.environmentVariable(forKey: "TARGETNAME")
    }
    
    public static var sourceRootURL: URL? {
        guard let sourceRootPath = XcodeEnvironment.environmentVariable(forKey: "SOURCE_ROOT") else { return nil }
        return URL(fileURLWithPath: sourceRootPath)
    }
    
    public static var platformName: PlatformName {
        guard let path = XcodeEnvironment.environmentVariables.filter({ $0.0 == "PLATFORM_NAME" }).map({ $0.1 }).first else {
            XcodeLogger.output(message: "Environment doesn't provide PLATFORM_NAME", type: .error, line: #line)
            return .unsupported
        }
        return PlatformName(rawValue: path) ?? .unsupported
    }
    
    public static var builtProductsFolderURL: URL? {
        guard let builtProductsFolderPath = XcodeEnvironment.environmentVariable(forKey: "BUILT_PRODUCTS_DIR") else { return nil }
        return URL(fileURLWithPath: builtProductsFolderPath)
    }
    
    public static var frameworksFolderPathComponent: String? {
        return XcodeEnvironment.environmentVariable(forKey: "FRAMEWORKS_FOLDER_PATH")
    }
    
    public static var frameworksFolderURL: URL? {
        guard let frameworksFolderPathComponent = frameworksFolderPathComponent else { return nil }
        return XcodeEnvironment.builtProductsFolderURL?.appendingPathComponent(frameworksFolderPathComponent)
    }

}
