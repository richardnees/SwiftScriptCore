import XCTest
@testable import SwiftScriptCore

class XcodeLoggerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_outputNoteNoIdentation() {
        XcodeLogger.output(message: "Not - No Indentation", type: .note)
    }
    
    func test_outputNoteDoubleIdentation() {
        XcodeLogger.output(message: "Note - Double Indentation", type: .note, indentation: 2)
    }
    
    func test_outputError() {
        XcodeLogger.output(message: "Error", type: .error)
    }
}
