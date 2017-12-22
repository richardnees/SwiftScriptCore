import Foundation

public class XcodeLog {
    
    public enum OutputType: String {
        case note
        case warning
        case error
    }
    
    public static func output(message: String, type: OutputType, file: String = #file, line: Int = #line, indentation: Int = 0) {
        
        let tab = "\t"
        var tabs: [String] = []
        for _ in 0..<indentation { tabs.append(tab) }
        let indentationString = tabs.joined(separator: "")
        
        print("\(file):\(line): \(type.rawValue): \(indentationString + message)\n")
        
        if type == .error {
            // Exit if we aren't running unit tests
            guard let _ = XcodeEnv.environmentVariables.filter({ $0.0 == "XCTestConfigurationFilePath" }).map({ $0.1 }).first else {
                exit(1)
            }
        }
    }
}
