//
//  NetworkService.swift
//  BitcoinPriceChecker
//
//  Created by Kwaku Dapaah on 2/21/23.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private var currency: [String: Double]?
    
    private init() {}
    
    func getPrice() -> [String:Double]?{
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String:Double] {
                        DispatchQueue.main.async {
                            self.currency = jsonDictionary
                        }
                    }
                }
            }.resume()
        }
        return self.currency
    }
}
