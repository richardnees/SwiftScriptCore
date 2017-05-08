import Foundation

public class Git {
    public static var currentBranch: String {
        return Bash.run(command: "git", arguments: ["rev-parse", "--abbrev-ref", "HEAD"])
    }

    public static var currentCommitHash: String {
        return Bash.run(command: "git", arguments: ["rev-parse", "HEAD"])
    }

    public static var commitCount: Int {
        let commitCountString = Bash.run(command: "git", arguments: ["rev-list", "HEAD", "--count"])
        return Int(commitCountString) ?? -1
    }
}
