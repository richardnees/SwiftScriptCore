import Foundation

public extension XcodeEnv {
    public struct Key : RawRepresentable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

public extension XcodeEnv.Key {
    public static let builtProductsDir = XcodeEnv.Key(rawValue: "BUILT_PRODUCTS_DIR")
    public static let configurationName = XcodeEnv.Key(rawValue: "CONFIGURATION")
    public static let dyldFrameworkPath = XcodeEnv.Key(rawValue: "DYLD_FRAMEWORK_PATH")
    public static let frameworksFolderPath = XcodeEnv.Key(rawValue: "FRAMEWORKS_FOLDER_PATH")
    public static let infoPlistFile = XcodeEnv.Key(rawValue: "INFOPLIST_FILE")
    public static let platformName = XcodeEnv.Key(rawValue: "PLATFORM_NAME")
    public static let sourceRoot = XcodeEnv.Key(rawValue: "SOURCE_ROOT")
    public static let targetName = XcodeEnv.Key(rawValue: "TARGETNAME")
}
