import UIKit

struct CoinModel: Decodable {
    var symbol: String = ""
    var image: UIImage = UIImage()
    var price: Float = 0.0
    var amount: Float = 0.0
    var historicalData: [Double] = []
    
    init(symbol: String) {
        self.symbol = symbol
        if let image = UIImage(named: symbol) {
            self.image = image
        }
    }
}
