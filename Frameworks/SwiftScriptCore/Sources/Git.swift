import Foundation
import Bash

public class Git {
    public let gitDirectoryPath: String
    
    public init(gitDirectoryPath: String) {
        self.gitDirectoryPath = gitDirectoryPath
    }
    
    public var currentBranch: String {
        return Bash.sync(command: "git", arguments: ["rev-parse", "--abbrev-ref", "HEAD"], workingDirectory: gitDirectoryPath)
    }

    public var currentCommitHash: String {
        return Bash.sync(command: "git", arguments: ["rev-parse", "HEAD"], workingDirectory: gitDirectoryPath)
    }

    public var commitCount: Int {
        let commitCountString = Bash.sync(command: "git", arguments: ["rev-list", "HEAD", "--count"], workingDirectory: gitDirectoryPath)
        return Int(commitCountString) ?? -1
    }
}
