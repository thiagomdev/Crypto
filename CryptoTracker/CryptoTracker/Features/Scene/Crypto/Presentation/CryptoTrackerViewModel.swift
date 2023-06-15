import Foundation

protocol CryptoTrackerViewModelProtocol {
    func displaySymbol() -> [String]
}

final class CryptoTrackerViewModel {
    private var model: [CoinModel]
    private let symbols = ["BTC", "ETH", "LTC"]
    
    init(model: [CoinModel]) {
        self.model = model
    }
}

extension CryptoTrackerViewModel: CryptoTrackerViewModelProtocol {
    func displaySymbol() -> [String] {
        symbols.forEach { symbol in
            let coin = CoinModel(symbol: symbol)
            model.append(coin)
        }
        return symbols
    }
}
