import Foundation

protocol CryptoTrackerViewModelProtocol {
    func displaySymbols() -> [String]
}

final class CryptoTrackerViewModel {
    private var model: [CoinModel]
    private let symbols = ["BTC", "ETH", "LTC"]
    
    init(model: [CoinModel]) {
        self.model = model
    }
}

extension CryptoTrackerViewModel: CryptoTrackerViewModelProtocol {
    func displaySymbols() -> [String] {
        symbols.forEach { symbol in
            let coin = CoinModel(symbol: symbol)
            model.append(coin)
        }
        return symbols
    }
}
