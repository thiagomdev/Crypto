import UIKit

final class CryptoViewController: UIViewController {

    // MARK: - Components
    private lazy var cryptoTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Methods
    
    // MARK: - Selectors
}

// MARK: - UITableViewDataSource
extension CryptoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension CryptoViewController: UITableViewDelegate {
    
}

// MARK: - ViewConfiguration
extension CryptoViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(cryptoTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cryptoTableView.topAnchor.constraint(
                equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor,
                multiplier: 1
            ),
            
            cryptoTableView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: view.leadingAnchor,
                multiplier: 1
            ),
            
            view.trailingAnchor.constraint(
                equalToSystemSpacingAfter: cryptoTableView.trailingAnchor,
                multiplier: 1
            ),
            
            view.bottomAnchor.constraint(
                equalToSystemSpacingBelow: cryptoTableView.bottomAnchor,
                multiplier: 1
            )
        ])
    }
    
    func viewConfiguration() {
        view.backgroundColor = .systemBackground
    }
}
