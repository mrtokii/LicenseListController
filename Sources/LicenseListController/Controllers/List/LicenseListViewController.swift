import UIKit

open class LicenseListViewController: UIViewController {
    
    private let entries: [LicenseEntry]
    private let detailsControllerType: LicenseDetailsViewController.Type
    
    // MARK: - Public Properties
    
    public let tableView = UITableView()
    
    // MARK: - Public Initializers
    
    public init(title: String,
                sources: [LicenseEntrySource],
                detailsControllerType: LicenseDetailsViewController.Type = LicenseDetailsViewController.self) {
        
        self.detailsControllerType = detailsControllerType
        self.entries = sources.flatMap {
            $0.entries
        }.sorted(by: {
            $0.title.lowercased() < $1.title.lowercased()
        })
        
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = title
        
        if navigationController?.viewControllers.count ?? 1 < 2 {
            navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done,
                                                      target: self,
                                                      action: #selector(closeButtonAction))
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override public func loadView() {
        view = tableView
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: .entryCellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Open Methods
    
    open func configureCell(_ cell: UITableViewCell, with entry: LicenseEntry) {
        cell.textLabel?.text = entry.title
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
    }
    
    // MARK: - Private Methods
    
    @objc private func closeButtonAction() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension LicenseListViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entries.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: .entryCellIdentifier)!
        configureCell(cell, with: entries[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension LicenseListViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let entry = entries[indexPath.row]
        let detailsController = detailsControllerType.init(entry: entry)
        
        navigationController?.pushViewController(detailsController, animated: true)
    }
}

// MARK: - Constants

fileprivate extension String {
    static let entryCellIdentifier = "EntryCell"
}
