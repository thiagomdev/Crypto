import Foundation

protocol CryptoTrackerViewModelProtocol {
    func showSymbols()
}

final class CryptoTrackerViewModel {
    private var model: [CoinModel]
    private let symbols = ["BTC", "ETH", "LTC"]
    
    init(model: [CoinModel]) {
        self.model = model
    }
    
    var count: Int {
        model.count
    }
}

extension CryptoTrackerViewModel: CryptoTrackerViewModelProtocol {
    func showSymbols() {
        symbols.forEach { symbol in
            let coin = CoinModel(symbol: symbol)
            model.append(coin)
        }
    }
}
