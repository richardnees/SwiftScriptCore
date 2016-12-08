import XCTest
@testable import SwiftScriptCore

class ShellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_run_withoutArguments() {
        let result = Shell.run(launchPath: "/bin/pwd", arguments: [])
        
        XCTAssertEqual(result, "/tmp")
    }
    
    func test_run_withArguments() {
        let result = Shell.run(launchPath: "/bin/date", arguments: ["+%Y-%m-%dT%H:%M:%SZ"])
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime]
        let date = isoDateFormatter.date(from: result)
        
        XCTAssertNotEqual(result, "")
        XCTAssertNotNil(date)
    }
    
    func test_run_EmptyReturn() {
        let result = Shell.run(launchPath: "/usr/bin/cd", arguments: [])
        
        XCTAssertEqual(result, "")
    }
}
