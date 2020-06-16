import Foundation

/// Data source that uses 'LicensePlist' (mono0926/LicensePlist) output files
public struct LicensePlistEntrySource: LicenseEntrySource {
    
    public let entries: [LicenseEntry]
    
    // MARK: - Public Initializers
    
    /// Find all plist files inside given bundle and path
    public init(bundle: Bundle, path: String) {
        
        guard let files = bundle.urls(forResourcesWithExtension: "plist", subdirectory: path) else {
            entries = []
            return
        }
        
        entries = files.compactMap { url -> LicenseEntry? in
            let specifier = NSDictionary(contentsOfFile: url.path)?["PreferenceSpecifiers"] as? [[String: Any]]
                        
            guard let text = specifier?.first?["FooterText"] as? String else {
                return nil
            }
            
            let title = NSString(string: url.lastPathComponent).deletingPathExtension
            
            return LicenseEntry(title: title, text: text)
        }
    }
}
