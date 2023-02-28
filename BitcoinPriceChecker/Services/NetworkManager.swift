//
//  NetworkService.swift
//  BitcoinPriceChecker
//
//  Created by Leng Trang on 2/26/23.
//

import Foundation

protocol CurrencyDataDelegate: AnyObject {
    func receiveCurrencyData(currencyInfo: [String: Double]?)
}
class NetworkManager {
    weak var delegate: CurrencyDataDelegate?
    // URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR")
    let urlPrefix = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms="
    var currencyData: [String: Double]?
//    {
//        willSet{
//            self.delegate?.receiveCurrencyData(currencyInfo: self.currencyData)
//        }
//    }
        
    init(){
    }
    
    func getServiceData() {
        guard let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") else {
            print("URL Error")
            return
        }
        let urlRequest = URLRequest(url: url)
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
              print("error calling GET on /todos/1")
              print(error!)
              return
            }
            
            // make sure we got data
            guard let data = data else {
              print("Error: did not receive data")
              return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let currency = try? JSONDecoder().decode([String: Double].self, from: data) else {
                    print("Error parsing")
                    return
                }
                self.currencyData = currency
                self.delegate?.receiveCurrencyData(currencyInfo: currency)
            }
            
        }
        task.resume()
    }
}

struct Currency: Codable {
    var currency: Double
}
