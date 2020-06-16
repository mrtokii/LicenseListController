/// Model for storing software name and license text
public struct LicenseEntry {
    
    public let title: String
    public let text: String
    
    public init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}
