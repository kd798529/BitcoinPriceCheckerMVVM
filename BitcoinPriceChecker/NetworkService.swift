//
//  NetworkService.swift
//  BitcoinPriceChecker
//
//  Created by Kwaku Dapaah on 2/21/23.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private var currencyData: Currency?
    
    private init() {}
    
    func getPrice() -> Currency?{
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    self.currencyData = try? JSONDecoder().decode(Currency.self, from: data)
                }
            }.resume()
        }
        return self.currencyData
    }
}


