import UIKit

open class LicenseDetailsViewController: UIViewController {
    
    private let entry: LicenseEntry
    
    // MARK: - Public Properties
    
    public let textView = UITextView()
    
    // MARK: - Public Initializers
    
    public required init(entry: LicenseEntry) {
        self.entry = entry
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        textView.isEditable = false
        textView.text = entry.text
        
        if #available(iOS 11, *) {
            textView.contentInsetAdjustmentBehavior = .always
        }
        
        textView.contentOffset.y = 0
        
        navigationItem.title = entry.title
    }
}
