/// Defines custom license entries list
public struct CustomEntrySource: LicenseEntrySource {
    
    public let entries: [LicenseEntry]
    
    // MARK: - Public Initializers
    
    public init(_ entries: [LicenseEntry]) {
        self.entries = entries
    }
}
