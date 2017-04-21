import Foundation

public extension XcodeEnvironment {
    public struct Key : RawRepresentable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

public extension XcodeEnvironment.Key {
    public static let builtProductsDir = XcodeEnvironment.Key(rawValue: "BUILT_PRODUCTS_DIR")
    public static let frameworksFolderPath = XcodeEnvironment.Key(rawValue: "FRAMEWORKS_FOLDER_PATH")
    public static let platformName = XcodeEnvironment.Key(rawValue: "PLATFORM_NAME")
    public static let sourceRoot = XcodeEnvironment.Key(rawValue: "SOURCE_ROOT")
    public static let targetName = XcodeEnvironment.Key(rawValue: "TARGETNAME")
}
