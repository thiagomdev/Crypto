import UIKit

final class CryptoTrackerViewController: UIViewController {

    // MARK: - Properties
    private let viewModel: CryptoTrackerViewModel
    
    // MARK: - Components
    private lazy var cryptoTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.rowHeight = 60
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initializers
    init(viewModel: CryptoTrackerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Methods
    
    // MARK: - Selectors
}

// MARK: - UITableViewDataSource
extension CryptoTrackerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.displaySymbols().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let coin = viewModel.displaySymbols()[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.text = coin
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CryptoTrackerViewController: UITableViewDelegate {
    
}

// MARK: - ViewConfiguration
extension CryptoTrackerViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(cryptoTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cryptoTableView.topAnchor.constraint(
                equalToSystemSpacingBelow: view.topAnchor,
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
