import Foundation

protocol CryptoTrackerServiceProtocol {
    func makeRequest(listOfSymbols: String, callback: @escaping(Result<CoinModel, Error>) -> Void)
}

enum CryptoTrackerRequest: Request {
    case `default`(String)
    
    var endpoint: String {
        switch self {
        case let .default(listOfSymbols):
            return "/data/pricemulti?fsyms=\(listOfSymbols)&tsyms=USD"
        }
    }
    
    var method: HttpMethod { .get }
    var parameters: [String : String]? { nil }
    var header: [String : String]? { nil }
    var body: Data? { nil }
}

final class CryptoTrackerService: CryptoTrackerServiceProtocol {
    private let network: NetworkingProtocol
    private var task: RequestTasking?

    init(network: NetworkingProtocol = Networking()) {
        self.network = network
    }
    
    func makeRequest(listOfSymbols: String, callback: @escaping (Result<CoinModel, Error>) -> Void) {
        task = network.make(request: CryptoTrackerRequest.default(listOfSymbols), responseType: CoinModel.self, completion: { result in
            switch result {
            case let .success(model):
                callback(.success(model))
            case let .failure(err):
                callback(.failure(err))
            }
        })
        task?.resume()
    }
}
