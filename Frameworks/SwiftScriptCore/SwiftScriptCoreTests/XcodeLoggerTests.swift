import XCTest
@testable import SwiftScriptCore

class XcodeLogTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_outputNoteNoIdentation() {
        XcodeLog.output(message: "Not - No Indentation", type: .note)
    }
    
    func test_outputNoteDoubleIdentation() {
        XcodeLog.output(message: "Note - Double Indentation", type: .note, indentation: 2)
    }
    
    func test_outputError() {
        XcodeLog.output(message: "Error", type: .error)
    }
}
