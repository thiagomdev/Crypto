import UIKit

final class CryptoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension CryptoViewController: ViewConfiguration {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func viewConfiguration() {
        view.backgroundColor = .systemBackground
    }
}
