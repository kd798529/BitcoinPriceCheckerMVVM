//
//  CurrencyUtility.swift
//  BitcoinPriceChecker
//
//  Created by Leng Trang on 2/26/23.
//

import Foundation

struct CurrencyUtility {
    static func formattedCurrency(currencyType: CurrencyConst, currencyData: [String: Double]) -> String {
        let currencySelected = currencyType.rawValue
        let price = currencyData[currencySelected] ?? 00.00
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencySelected
        guard let currencyFormatted: String = formatter.string(from: NSNumber(value: price)) else { return "" }
        return currencyFormatted
    }
}

enum CurrencyConst: String {
    case usd = "USD"
    case eur = "EUR"
    case jpy = "JPY"
}
