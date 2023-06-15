import Foundation

final class CryptoTrackerViewModel {
    private var model: CoinModel
    private let symbols = ["BTC", "ETH", "LTC"]
    
    init(model: CoinModel) {
        self.model = model
    }
    
    func showSymbols() {
        symbols.forEach { symbol in
            model.symbol = symbol
        }
    }
}
