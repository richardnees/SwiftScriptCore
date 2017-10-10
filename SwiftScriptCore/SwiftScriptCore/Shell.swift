import Foundation

public class Shell {
    public static func run(launchPath: String, arguments: [String]) -> String {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments
        
        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            if output.isEmpty == false {
                let subString = String(output[output.startIndex..<output.index(output.endIndex, offsetBy: -1)])
                return subString
            }
            return output
        }
        return ""
    }
}
