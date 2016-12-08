import Foundation

public class Bash {    
    public static func run(command: String, arguments: [String]) -> String {
        let whichPathForCommand = Shell.run(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
        return Shell.run(launchPath: whichPathForCommand, arguments: arguments)
    }
}
