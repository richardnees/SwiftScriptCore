import XCTest
@testable import SwiftScriptCore

class BashTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_run_withoutArguments() {
        let result = Bash.run(command: "pwd", arguments: [])
        
        XCTAssertEqual(result, "/tmp")
    }
    
    func test_run_withArguments() {
        let result = Bash.run(command: "date", arguments: ["+%Y-%m-%dT%H:%M:%SZ"])
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime]
        let date = isoDateFormatter.date(from: result)
        
        XCTAssertNotEqual(result, "")
        XCTAssertNotNil(date)
    }
    
    func test_run_EmptyReturn() {
        let result = Bash.run(command: "cd", arguments: [])
        
        XCTAssertEqual(result, "")
    }
}
