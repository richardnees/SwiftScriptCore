import XCTest
@testable import SwiftScriptCore

class XcodeEnvTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_environmentVariables() {
        XCTAssertNotNil(XcodeEnv.environmentVariables)
    }

    func test_environmentVariablesNotEmpty() {
        XCTAssertFalse(XcodeEnv.environmentVariables.isEmpty)
    }
    
    func test_targetName() {
        setenv("TARGETNAME", "PlayPlex", 1)
        
        XCTAssertEqual(XcodeEnv.targetName, "PlayPlex")
    }

    func test_targetName_isNil() {
        unsetenv("TARGETNAME")
     
        XCTAssertNil(XcodeEnv.targetName)
    }

    func test_sourceRootURL() {
        setenv("SOURCE_ROOT", "/Users/dev/Project", 1)
        
        XCTAssertEqual(XcodeEnv.sourceRootURL, URL(fileURLWithPath: "/Users/dev/Project"))
        
    }
    
    func test_sourceRootURL_isNil() {
        unsetenv("SOURCE_ROOT")
        
        XCTAssertNil(XcodeEnv.sourceRootURL)
    }
    
    func test_platformName_iphoneos() {
        setenv("PLATFORM_NAME", "iphoneos", 1)
        
        XCTAssertEqual(XcodeEnv.platformName, PlatformName(rawValue: "iphoneos"))
    }

    func test_platformName_iphonesimulator() {
        setenv("PLATFORM_NAME", "iphonesimulator", 1)
        
        XCTAssertEqual(XcodeEnv.platformName, PlatformName(rawValue: "iphonesimulator"))
    }

    func test_platformName_isNil() {
        unsetenv("PLATFORM_NAME")

        XCTAssertNotNil(XcodeEnv.platformName)
    }
    
    func test_platformName_isGarbage() {
        setenv("PLATFORM_NAME", "asdasdasd", 1)
        
        XCTAssertNotNil(XcodeEnv.platformName)
    }
    
    func test_builtProductsFolderURL() {
        setenv("BUILT_PRODUCTS_DIR", "/Users/dev/Project", 1)
        
        XCTAssertEqual(XcodeEnv.builtProductsFolderURL, URL(fileURLWithPath: "/Users/dev/Project"))
    }
    
    func test_builtProductsFolderURL_isNil() {
        unsetenv("BUILT_PRODUCTS_DIR")
        
        XCTAssertNil(XcodeEnv.builtProductsFolderURL)
    }

    func test_frameworksFolderURL() {
        setenv("BUILT_PRODUCTS_DIR", "/Users/dev/Project", 1)
        setenv("FRAMEWORKS_FOLDER_PATH", "Frameworks", 1)
        
        XCTAssertEqual(XcodeEnv.frameworksFolderURL, XcodeEnv.builtProductsFolderURL?.appendingPathComponent("Frameworks"))
    }
    
    func test_frameworksFolderURL_isNil() {
        unsetenv("FRAMEWORKS_FOLDER_PATH")
        
        XCTAssertNil(XcodeEnv.frameworksFolderURL)
    }
}
