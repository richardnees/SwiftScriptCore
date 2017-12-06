import Foundation
import Bash

public class Git {
    public static var currentBranch: String {
        return Bash.sync(command: "git", arguments: ["rev-parse", "--abbrev-ref", "HEAD"])
    }

    public static var currentCommitHash: String {
        return Bash.sync(command: "git", arguments: ["rev-parse", "HEAD"])
    }

    public static var commitCount: Int {
        let commitCountString = Bash.sync(command: "git", arguments: ["rev-list", "HEAD", "--count"])
        return Int(commitCountString) ?? -1
    }
}
