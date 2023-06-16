import Alamofire
import Foundation

protocol CryptoTrackerViewModelProtocol {
    func displaySymbols() -> [String]
    func displayPrices()
    func display(symbols: String)
}

final class CryptoTrackerViewModel {
    private var model: [CoinModel]
    private let symbols = ["BTC", "ETH", "LTC"]
    private let service: CryptoTrackerServiceProtocol
    
    init(service: CryptoTrackerServiceProtocol = CryptoTrackerService(), model: [CoinModel]) {
        self.service = service
        self.model = model
    }
}

extension CryptoTrackerViewModel: CryptoTrackerViewModelProtocol {
    func display(symbols: String) {
        service.makeRequest(listOfSymbols: symbols) { [weak self] result in
            switch result {
            case let .success(model):
                self?.model.append(model)
            case let .failure(err):
                print(err)
                break
            }
        }
    }
    
    func displaySymbols() -> [String] {
        symbols.forEach { symbol in
            let coin = CoinModel(symbol: symbol)
            model.append(coin)
        }
        return symbols
    }
    
    func displayPrices() {
        var listOfSymbols = ""
        model.forEach { value in
            listOfSymbols += value.symbol
            if value.symbol != model.last?.symbol {
                listOfSymbols += ","
            }
        }
    }
}
